const express = require('express');
const app = express();
app.use(express.json()); 


let orders = [];
let currentOrderId = 1;


let itemStock = {
    1: { name: 'Burger', stock: 10 },
    2: { name: 'Pasta', stock: 5 },
    3: { name: 'Pizza', stock: 8 }
};

// POST 

app.post('/orders', async (req, res) => {
    const { table_no, items, total_price } = req.body;

    
    if (!table_no || !items || !total_price) {
        return res.status(400).json({ error: 'Missing required fields (table_no, items, total_price)' });
    }

   
    try {
        
        await checkAndReserveStock(items);

        const newOrder = {
            order_id: currentOrderId++, 
            table_no,
            items,
            total_price,
            order_time: new Date().toISOString(),
            status: 'Pending'
        };

        
        orders.push(newOrder);

        res.status(201).json({
            order_id: newOrder.order_id,
            status: 'Order placed successfully',
            order_time: newOrder.order_time
        });
    } catch (error) {
        return res.status(400).json({ error: error.message });
    }
});

// GET

app.get('/orders/:order_id', (req, res) => {
    const { order_id } = req.params;

    
    const order = orders.find(o => o.order_id === parseInt(order_id));

    if (!order) {
        return res.status(404).json({ error: 'Order not found' });
    }

    res.json(order);
});


app.get('/orders', (req, res) => {
    res.json(orders);
});

// PUT

app.put('/orders/:order_id', async (req, res) => {
    const { order_id } = req.params;
    const { items, total_price, status } = req.body;

 
    let order = orders.find(o => o.order_id === parseInt(order_id));

    if (!order) {
        return res.status(404).json({ error: 'Order not found' });
    }

   
    try {
       
        if (items) await checkAndReserveStock(items);
        if (items) order.items = items;
        if (total_price) order.total_price = total_price;
        if (status) order.status = status;

        order.order_time = new Date().toISOString(); 

        res.json({
            order_id: order.order_id,
            status: 'Order updated successfully',
            order_time: order.order_time
        });
    } catch (error) {
        return res.status(400).json({ error: error.message });
    }
});

// DELETE

app.delete('/orders/:order_id', (req, res) => {
    const { order_id } = req.params;

 
    const orderIndex = orders.findIndex(o => o.order_id === parseInt(order_id));

    if (orderIndex === -1) {
        return res.status(404).json({ error: 'Order not found' });
    }


    orders.splice(orderIndex, 1);

    res.json({ status: 'Order deleted successfully' });
});

// CHECKING STOCK TO AVOID CONCURRENCY

async function checkAndReserveStock(items) {
    
    for (let item of items) {
        const itemDetails = itemStock[item.item_id];

        if (!itemDetails) {
            throw new Error(`Item with ID ${item.item_id} not found`);
        }


        if (itemDetails.stock < item.quantity) {
            throw new Error(`Not enough stock for item ${itemDetails.name}`);
        }


        itemDetails.stock -= item.quantity;
    }
}


app.listen(3000, () => {
    console.log('Server running on http://localhost:3000');
});



// RATE LIMITTER TO AVOID ATTACKS

const rateLimit = require('express-rate-limit');

const limiter = rateLimit({
    windowMs: 60 * 1000,
    max: 100, 
    message: "Too many requests, please try again later."
});

app.use(limiter);











// THE FOLLOWING SHOULD BE RUN IN POSTMAN TO INTERACT WITH THE SERVER
/*
BODY: raw
format: JSON
*/

// POST

// http://localhost:3000/orders

{
    "table_no": 1,
    "items": [
      {"item_id": 1, "quantity": 2},
      {"item_id": 2, "quantity": 1}
    ],
    "total_price": 25.50
  }
  
// output:

{
    "order_id": 1,
    "status": "Order placed successfully",
    "order_time": "2025-04-27T15:01:15.625Z"
}


// GET

{
    "order_id": 1,
    "table_no": 1,
    "items": [
      {"item_id": 1, "quantity": 2},
      {"item_id": 2, "quantity": 1}
    ],
    "total_price": 25.50,
    "order_time": "2025-04-27T10:00:00",
    "status": "Pending"
  }

// PUT

  {
    "items": [
      {"item_id": 1, "quantity": 3}
    ],
    "total_price": 30.00,
    "status": "Completed"
  }
  
  // output:

  {
    "order_id": 1,
    "status": "Order updated successfully",
    "order_time": "2025-04-27T15:03:02.726Z"
}

// DELETE

// In order to delete the data only the delete method has to be chosen and the correct order number like http://localhost:3000/orders/1