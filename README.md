# Part A - Quick Fixes

### Q1 (25 points)

List three essential features Bistro 92’s system needs for customer satisfaction and efficient order processing:

- **Real-time Order Updates**: Instant communication between the table device, kitchen, and admin dashboard. This involves the use of a database and wireless communication.

- **Error-Free Customization and Cancellation**: Easily customize orders (e.g., extra cheese, no onions) and allow customers to cancel within a time frame to correct mistakes.

- **Feedback**: Clear "Order Received" messages, and updates on order cancellation, readiness for delivery, and delivery status.

---

### Q2 (25 points)

Describe two design principles to make the smart pad interface intuitive for all users, including tech novices:

- **Minimalist Interface**: Use simple menus, large fonts, clear icons, and minimal text. Choose accessible color schemes for visually impaired users.

- **Consistent Navigation**: Buttons should consistently behave the same way (e.g., Button 3 always scrolls down) and have clear, engraved labels.

---

### Q3 (30 points)

Identify three potential security vulnerabilities and one solution for each:

- **Theft of Device**:  
  _Solution_: Attach a tamper alarm or physically secure devices to tables.

- **Order Tampering (Fake Orders)**:  
  _Solution_: Require a table-specific passcode or QR verification before final order submission. Devices should only work at their assigned table.

- **Cloud Data Breach**:  
  _Solution_: Use HTTPS encryption between ESP32 devices and cloud servers and store minimal customer data.

---

### Q4 (30 points)

Explain two strategies to keep Bistro 92’s system responsive and stable during peak hours:

- **Local Caching**: Store orders locally if the internet is slow and sync them once the connection stabilizes.

- **Load Balancing on Cloud Server**: Distribute incoming order requests across multiple servers to avoid overload.

---

### Q5 (40 points)

Describe one method to integrate the existing inventory system with Bistro 92’s new system without disrupting operations:

- **Use an API Bridge**: Create an intermediary program that pulls data from the inventory system and updates the smart pad system without directly modifying either side. This ensures both systems work independently and minimizes downtime. Continuous updates on processed, delivered, and pending items will be reflected in the database and dashboard.

![API Bridge between server and client (Source: Google)](https://mono-x.com/api-bridge/en/img/functions-1.png)

---

## Part C - Interactive Nutrition and Allergen Information with Personalized Suggestion

### Case

Customers are increasingly concerned about health and dietary needs, sometimes avoiding dining out due to fears of unsuitable meals. Uninformed ordering can lead to health issues and dissatisfaction.

### Solution: Interactive Nutritional and Allergen Information with Personalized Suggestions

Essential features:

1. **Nutritional Facts Chart**: Tapping a food item reveals a dropdown with nutritional information. Users can filter by nutrient priorities.
2. **Allergen Information**: Highlight dishes with common allergens.
3. **Personalized Menu**: Create customer profiles based on past orders and allergies to recommend suitable dishes.
4. **Real-Time Updates and Customization**: New dishes are categorized into allergen and dietary categories when updated.
5. **Dietary Preferences**: Ask users about their dietary choices (vegan, non-vegan, etc.) upon entering the menu.
6. **Feedback System**: Gather post-dining feedback to improve services.

---

### Technology

- **Nutritionix API**: Fetch real-time, detailed nutritional and allergen information.
- **Frontend**: Built with React for a highly interactive experience.
- **Backend**: Cloud-based system to ensure real-time updates and synchronization.

### Method

- The pad sends a request to the Nutritionix API.
- The API responds with formatted nutritional and allergen data.

---

### Benefits

- **Improved Customer Experience**: Higher satisfaction and engagement.
- **Customer Retention**: Personalized attention encourages return visits.
- **Minimized Risk of Allergic Reaction**: Reduces incidents and protects customer health.
- **Healthy Dining**: Ensures safe, nutritious dining choices.
- **Branding**: Enhances Bistro 92’s reputation for dependability and health-conscious offerings.
