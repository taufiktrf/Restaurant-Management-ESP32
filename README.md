# Part A - Quick Fixes

## Q1

List three essential features Bistro 92’s system needs for customer satisfaction and efficient order processing:

- **Real-time Order Updates**: Instant communication between the table device, kitchen, and admin dashboard. This involves the use of a database and wireless communication.

- **Error-Free Customization and Cancellation**: Easily customize orders (e.g., extra cheese, no onions) and allow customers to cancel within a time frame to correct mistakes.

- **Feedback**: Clear "Order Received" messages, and updates on order cancellation, readiness for delivery, and delivery status.

---

## Q2

Describe two design principles to make the smart pad interface intuitive for all users, including tech novices:

- **Minimalist Interface**: Use simple menus, large fonts, clear icons, and minimal text. Choose accessible color schemes for visually impaired users.

- **Consistent Navigation**: Buttons should consistently behave the same way (e.g., Button 3 always scrolls down) and have clear, engraved labels.

---

## Q3

Identify three potential security vulnerabilities and one solution for each:

- **Theft of Device**:  
  _Solution_: Attach a tamper alarm or physically secure devices to tables.

- **Order Tampering (Fake Orders)**:  
  _Solution_: Require a table-specific passcode or QR verification before final order submission. Devices should only work at their assigned table.

- **Cloud Data Breach**:  
  _Solution_: Use HTTPS encryption between ESP32 devices and cloud servers and store minimal customer data.

---

## Q4

Explain two strategies to keep Bistro 92’s system responsive and stable during peak hours:

- **Local Caching**: Store orders locally if the internet is slow and sync them once the connection stabilizes.

- **Load Balancing on Cloud Server**: Distribute incoming order requests across multiple servers to avoid overload.

---

## Q5

Describe one method to integrate the existing inventory system with Bistro 92’s new system without disrupting operations:

- **Use an API Bridge**: Create an intermediary program that pulls data from the inventory system and updates the smart pad system without directly modifying either side. This ensures both systems work independently and minimizes downtime. Continuous updates on processed, delivered, and pending items will be reflected in the database and dashboard.

![API Bridge between server and client (Source: Google)](https://mono-x.com/api-bridge/en/img/functions-1.png)

---


# Part B - Tech Tricks

## Q1

Design a database schema for Bistro 92 to track users, orders,
menu items, tables, and payments, optimized for fast queries:
- **Database Schema**  

![Database Schema](Schema.png)  
- **SQL Query**  

```sql
CREATE TABLE public."Orders"
(
	"ID" SERIAL PRIMARY KEY,
    "OrderID" INTEGER NOT NULL,
    "TableNo" INTEGER NOT NULL,
    "Item" TEXT NOT NULL,
    "Quantity" INTEGER NOT NULL,
    "ConfirmedAt" TIMESTAMP,
    "CompletedAt" TIMESTAMP
);

ALTER TABLE IF EXISTS public."Orders"
    OWNER TO postgres;
```  
[Bistro 92 Database File](./Bistro%2092%20Orders.sql)


  
## Q2

Write an SQL query to retrieve all orders from the last hour,
including table number, items ordered, and order time, optimized for speed:
 
- **SQL Query**  

```sql
SELECT *
FROM public."Orders"
WHERE "ConfirmedAt" >= (
    SELECT MAX("ConfirmedAt")
    FROM public."Orders"
) - INTERVAL '1 hour';
```


## Q3
 Implement a feature to notify kitchen staff in real-time when a
new order is placed, and describe your tech stack:
 
- **Implemented in Dashboard**  

There is a chart in our dashboard which only keeps track of currently processing orders. It gets updated once the order is delivered successfully. Thus, staff can easily see the orders which they need to process and prepare real-time.


## Q4
Describe a cloud-based system architecture for real-time
updates, data storage, and smart pad communication, ensuring low latency and
high availability:
 
- **Google Sheets**  

Google Sheets offers extreme simplicity and zero initial infrastructure cost, making it accessible for prototyping or very small-scale use. Its familiar interface allows easy manual data viewing, editing, and basic visualization. Built-in collaboration features simplify sharing status. Google Apps Script enables some basic automation for handling incoming data or simple triggers, provided the volume and real-time requirements are very low. It requires minimal setup compared to dedicated cloud architecture.





## Q5
Design a real-time dashboard showing pending orders, average
fulfillment time, and total sales, specifying tools and justifying your choices:
 
- **Power BI Dashboard**  

[Bistro 92 Dashboard](./Bistro%2092%20Dashboard.pbix)  
- **Preview**  

![Dashboard Preview](Bistro%2092%20Dashboard%20Sample.png) 


# Part D - Interactive Nutrition and Allergen Information with Personalized Suggestion

## Case

Many customers in the society prefer a healthy diet. With days passing, people are becoming more conscious about their health, and many are considering healthy choices. Adding to that, there are people with health issues who also want to have a good time with their friends and family at the restaurants. But what stops them is their constant doubt about whether the food will be according to their health requirements or will suit their gut. Which sometimes becomes really important because, unknowingly, sometimes they order something that will not really be okay according to their taste or their respective health condition.

## Solution: Interactive nutritional and allergen information with personalised suggestions.

The essential features of this system are:


Essential features:

1. **Nutritional Facts Chart**: On tapping a food item, a dropdown menu will appear that will tell the customer the nutritional values of the food items. People with a preference to a specific food nutrient item can also select the category option of that nutrient and prioritize their needs.
2. **Allergen Information**: The dishes will be mentioned with their allergen information, specifying if the dish contains common allergens.
3. **Personalized Menu**: For every customer, we can study their choices. Suppose a customer loves seafood pizza, but she is allergic to shrimp and hence always complains about the presence of shrimp. In those cases, we can always create a profile of the customer to study their choices. When they come again to the restaurant, we can let them know that we remember their choice, and that will increase customer retention and customer interaction with us. Finally, after studying the customer needs for quite some time, we can create a personalized menu that will constantly update according to the customer behavior and their preferences. We can integrate the use of machine learning here.
4. **Real-Time Updates and Customization**: In any case, if the restaurant updates their food or adds new food, upon declaring the nutrients of the food, the food will be categorized in the segments that were created before. Allergen, non-allergen, mildly allergic to some customers, etc. can be the categories.
5. **Dietary Preferences**: When the customer first enters the menu, the system can ask for the choices of preference—vegan, non-vegan, okay with both, etc. If any customer wants to skip this, we can also keep the general method for them as well.
6. **Feedback System**: Upon finishing the dining, the system can ask for the reviews of the customer and about the dining experience. This will constantly evolve the system.

---

## Technology

There is a nutritional information API called Nutritionix, which will help us fetch the real-time data with very detailed nutrition and allergen information.

## Method

- The pad will send request to the API
- The data will be dispatched from the API in an understandable format  

---

For the frontend interface, we can use React. This will make the frontend of the system very user interactive. The pad will be connected to a cloud-based system, which will make sure that the real-time information and updated menu are displayed on the pad.

## Benefits

- **Improved Customer Experience**: Customer satisfaction will be much elevated when this technology is used.
- **Customer Retention**: When the customers feel that Bistro 92 knows their preferences and their choices, they will come back again.
- **Minimized Risk of Allergic Reaction**: Many a time customers face instant allergic reactions due to the presence of allergenic items. It nullifies the total outing for them and also creates negative remarks about the restaurant among others.
- **Healthy Dining**: Customers will not experience any health hazards due to the wrong choice of foods, which increases reliability.
- **Branding**: Bistro 92 will have a good reputation in the food segment and can attract more customers for its dependability.

