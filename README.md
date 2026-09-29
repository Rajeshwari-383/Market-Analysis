# 📊 CDACL-006 – Market Analysis

## 📌 Project Overview

This project was completed as part of a **DataMites Client Project – CDACL-006: Market Analysis**.

The project focuses on analyzing customer purchasing behavior and product performance using SQL.

The analysis covers customer ordering patterns, product popularity, reorder behavior, department and aisle performance, order timing, basket size, and customer activity.

The objective is to derive meaningful business insights that can support marketing strategies and improve customer satisfaction.

---

## 🏢 Project Type

**Client Project – DataMites**

**Project Code:** CDACL-006  
**Project Title:** Market Analysis

---

## 🎯 Business Objectives

The main objectives of this project were to:

- Analyze customer purchasing behavior
- Identify the most frequently ordered products
- Analyze product reorder behavior
- Identify high-performing aisles and departments
- Understand customer ordering patterns
- Analyze order timing and order volume
- Calculate average order size
- Identify high-frequency customers
- Analyze product distribution across departments and aisles
- Generate actionable marketing insights

---

## 🛠️ Tools & Technologies

- **MySQL**
- **SQL**
- **Microsoft PowerPoint**
- **Microsoft Word**
- **GitHub**

---

## 🗂️ Database Tables

The analysis was performed using the following tables:

- `orders`
- `order_products_train`
- `products`
- `aisles`
- `departments`

### Data Relationship

```text
Orders
   │
   │ order_id
   ▼
Order Products
   │
   │ product_id
   ▼
Products
   │
   ├── aisle_id ─────────► Aisles
   │
   └── department_id ───► Departments

---

## 🔎 Project Analysis

### 1. Aisle Analysis

Analyzed the number of products available in each aisle and identified the aisles with the highest product counts.

### 2. Department Analysis

Analyzed the available departments and the distribution of products across departments.

### 3. Customer Analysis

Analyzed:

* Unique users
* Average days between orders
* Customer order frequency
* Users with the highest number of orders
* Users purchasing products across departments

### 4. Order Analysis

Analyzed:

* Peak ordering hours
* Order volume by day
* Orders by hour
* Average products per order
* Order-size distribution
* Average order size by day

### 5. Product Analysis

Analyzed:

* Most ordered products
* Product reorder rates
* Products reordered more than once
* Most reordered product in each department

### 6. Category Analysis

Analyzed:

* Products by department
* Products by aisle
* Products by aisle and department
* Average reorder rate by aisle

---

## 📊 Key Findings

### Customer Behavior

* **63,100** unique users were identified.
* Average order size was **10.53 products**.
* The largest order-size group was **6–10 products**, with **29,635 orders**.
* The peak ordering hour was **10:00**, with **88,228 orders**.
* The highest observed customer order count was **100 orders**.

### Most Ordered Products

| Rank | Product                | Order Count |
| ---: | ---------------------- | ----------: |
|    1 | Banana                 |      14,136 |
|    2 | Bag of Organic Bananas |      11,639 |
|    3 | Organic Strawberries   |       8,233 |
|    4 | Organic Baby Spinach   |       7,443 |
|    5 | Large Lemon            |       6,148 |
|    6 | Organic Avocado        |       5,606 |
|    7 | Organic Hass Avocado   |       5,489 |
|    8 | Strawberries           |       4,920 |
|    9 | Limes                  |       4,609 |
|   10 | Organic Raspberries    |       4,200 |

### Reorder Behavior

The highest observed aisle-level reorder rates included:

| Aisle                             | Reorder Rate |
| --------------------------------- | -----------: |
| Milk                              |       79.23% |
| Water / Seltzer / Sparkling Water |       73.79% |
| Fresh Fruits                      |       73.53% |
| Eggs                              |       72.69% |
| Packaged Produce                  |       71.39% |

### Department Customer Reach

**Produce** had the highest number of distinct purchasing users with **22,303 users**.

---

## 🛒 Order Size Distribution

| Order Size     | Number of Orders |
| -------------- | ---------------: |
| 1 product      |            5,211 |
| 2–5 products   |           24,745 |
| 6–10 products  |           29,635 |
| 11–20 products |           29,051 |
| 21+ products   |           10,932 |

The average order contained **10.53 products**.

---

## ⏰ Ordering Pattern

The highest observed order volume occurred at:

**10:00 → 88,228 orders**

Other high-volume hours included:

* 14:00 → 86,905
* 15:00 → 86,888
* 13:00 → 85,652
* 12:00 → 84,204

Ordering activity was concentrated mainly during daytime hours.

---

## 📅 Order Pattern by Day

| Order Day Code | Order Volume | Average Order Size |
| -------------: | -----------: | -----------------: |
|              0 |      183,939 |              11.72 |
|              1 |      180,025 |              10.29 |
|              2 |      143,162 |               9.91 |
|              3 |      133,839 |               9.67 |
|              4 |      130,367 |               9.85 |
|              5 |      139,183 |              10.20 |
|              6 |      138,060 |              11.03 |

The source data uses `order_dow` values from **0–6**. The weekday names were not assigned because the source mapping was not supplied.

---

## 🔁 Most Reordered Products by Department

| Department   | Product                    | Reorder Count |
| ------------ | -------------------------- | ------------: |
| Produce      | Banana                     |        12,461 |
| Dairy eggs   | Organic Whole Milk         |         3,154 |
| Beverages    | Sparkling Water Grapefruit |         2,027 |
| Deli         | Original Hummus            |         1,676 |
| Bakery       | 100% Whole Wheat Bread     |         1,319 |
| Frozen       | Blueberries                |         1,051 |
| Pantry       | Extra Virgin Olive Oil     |           780 |
| Canned goods | Organic Black Beans        |           752 |
| Breakfast    | Honey Nut Cheerios         |           541 |
| Meat seafood | Ground Turkey Breast       |           501 |

---

## 💡 Business Insights

The analysis identified several important patterns:

* Fresh produce products were strongly represented among the most ordered products.
* Customers frequently purchased multiple products within a single order.
* Several essential-product categories showed strong repeat-purchase behavior.
* Ordering activity was concentrated during daytime hours.
* Produce had the highest customer reach among departments.
* High-frequency customers represent an opportunity for loyalty and personalized engagement.
* Multi-product baskets create opportunities for cross-selling and product bundles.

---

## 📈 Marketing Recommendations

### 1. Personalized Recommendations

Recommend products based on customers' previous purchasing behavior.

### 2. Replenishment Reminders

Send reminders for frequently reordered products and essential categories.

### 3. Cross-Selling

Recommend complementary products together to encourage larger baskets.

### 4. Time-Based Campaigns

Use periods of high ordering activity as potential windows for targeted campaigns.

### 5. Product Bundles

Create bundles around commonly observed multi-product orders.

### 6. Customer Loyalty

Develop personalized engagement strategies for high-frequency customers.

---

## 📁 Project Structure

```text
CDACL-006-Market-Analysis/
│
├── README.md
|
├── Presentation/
│   └── Market_Analysis_Presentation.pptx
│
├── Documentation/
    └── Market_Analysis_Insights.docx
```

---

## ⚠️ Data & Confidentiality

This project was completed as part of a **DataMites Client Project**.

For confidentiality and security:

* Database credentials are not included.
* Passwords are not included.
* Server connection details are not included.
* Raw client database files are not included.
* Only portfolio-appropriate project materials are included.

The supplied project database contains `order_products_train`, which was used for the available item-level analysis.

---

## 📌 Conclusion

The Market Analysis provided insights into customer purchasing behavior, order patterns, product performance, and repeat purchasing.

The findings can support data-driven approaches such as:

* Personalized recommendations
* Replenishment reminders
* Cross-selling
* Product bundling
* Targeted campaigns
* Customer loyalty strategies

---

## 👩‍💻 Author

**Rajeshwari**

**Data Analyst**

**Skills:** SQL | Python | Power BI | Tableau | Excel

[LinkedIn](https://www.linkedin.com/in/rajeshwari-pasunuri)

