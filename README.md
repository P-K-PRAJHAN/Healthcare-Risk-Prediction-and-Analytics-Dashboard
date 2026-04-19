# 🏥 Healthcare Risk Prediction and Analytics

## 📌 Project Overview

This project presents an **end-to-end healthcare analytics solution** using **SQL, Power BI, and Machine Learning**. It focuses on analyzing patient data, identifying high-risk individuals, and generating predictive insights through interactive dashboards.

The system integrates:

* Data processing using SQL
* Visualization using Power BI
* Predictive modeling using Python (Jupyter Notebook)

---

## 🎯 Objectives

* Analyze healthcare data to identify **high-risk patients**
* Visualize **risk distribution across age groups and symptoms**
* Perform **patient segmentation using clustering**
* Implement **predictive analytics using Machine Learning**
* Provide **interactive dashboards with dynamic filtering**
* Demonstrate **OLAP (multidimensional analysis)**
* Enhance insights with **Map visualization and Alert system**

---

## 🗂️ Project Structure

```
📁 Healthcare-Risk-Prediction
│
├── 📊 Healthcare Risk Prediction and Analytics.pbix   # Power BI Dashboard
├── 🧠 ML.ipynb                                       # Machine Learning (Jupyter Notebook)
├── 📄 patients.xlsx                                  # Patient dataset
├── 📄 predictions.xlsx                               # ML output (predictions & clusters)
├── 🗄️ Proj.sql                                       # SQL queries & database schema
├── 📄 stroke_risk_dataset.xlsx                       # Raw dataset
```

---

## 🚀 Technologies Used

* **Power BI** → Data Visualization
* **Python (Jupyter Notebook)** → Machine Learning
* **MySQL / SQL** → Data Processing
* **Excel** → Data Storage

---

## 🧾 Dataset Description

### 1. stroke_risk_dataset.xlsx

* Raw healthcare dataset
* Contains:

  * `id`, `age`
  * `stroke_risk`
  * `at_risk`
  * `symptoms`

---

### 2. patients.xlsx

* Processed dataset used in Power BI
* Includes:

  * Age groups
  * Risk classification
  * Derived fields

---

### 3. predictions.xlsx

* Output from Machine Learning models
* Contains:

  * `prediction` (0 = Low, 1 = High)
  * `risk_predicted`
  * `cluster` (segmentation)

---

## 🗄️ SQL Implementation

* Database created to structure healthcare data

* Tables:

  * `patients`
  * `fact_health`
  * `dim_age`

* Example SQL View:

```sql
CREATE VIEW healthcare_view AS 
SELECT f.id, f.age, d.age_group, f.stroke_risk, f.at_risk
FROM fact_health f
JOIN dim_age d ON f.age = d.age;
```

* Used for structured data retrieval into Power BI

---

## 📊 Power BI Dashboard

The Power BI report includes multiple dashboards:

### 🔹 Static Dashboards

* Patient Summary Report
* Disease Distribution

### 🔹 Dynamic Dashboards

* Interactive KPI Dashboard
* Patient Detail Dashboard
* Healthcare Traffic Analysis

### 🔹 Advanced Dashboards

* ML Prediction & Segmentation
* OLAP Analysis (Matrix visualization)
* Map & Alert Dashboard

---

### 📈 Key Visualizations

* KPI Cards (Total Patients, Risk %, Avg Risk)
* Bar Charts (Age vs Risk)
* Pie Charts (Risk Distribution)
* Scatter Plot (Actual vs Predicted Risk)
* Cluster Visualization
* Matrix (OLAP)
* Map (Region-based simulation)
* Alert Card (DAX-based condition)

---

## 🤖 Machine Learning (Jupyter Notebook)

Implemented using Python:

### ✔ Models Used

* Logistic Regression → Risk Classification
* Linear Regression → Risk Prediction
* K-Means Clustering → Patient Segmentation

### ✔ Example Code

```python
from sklearn.linear_model import LogisticRegression

model = LogisticRegression(max_iter=1000)
model.fit(X, y)

df['prediction'] = model.predict(X)
```

---

## 🧠 OLAP Analysis

* Performed multidimensional analysis using Matrix visual:

  * Rows → Age Group
  * Columns → Risk (at_risk)
  * Values → Count of patients

### Operations:

* Roll-up
* Drill-down
* Slice & Dice

---

## 🗺️ Map Visualization (Enhancement)

Since no geographic data was available, a **Region column** was created:

```DAX
Region = 
SWITCH(
    TRUE(),
    'healthcare_db patients'[age] < 30, "South",
    'healthcare_db patients'[age] < 50, "North",
    'healthcare_db patients'[age] < 70, "East",
    "West"
)
```

---

## 🔔 Alert System (Enhancement)

```DAX
High Risk Alert = 
IF([Risk %] > 60, "⚠ High Risk Patients", "Normal")
```

* Displays dynamic alerts based on risk threshold

---

## 📊 Results & Insights

* ~65% of patients fall under high-risk category
* Senior age group has highest risk
* Symptoms like chest pain strongly influence risk
* ML models effectively classify and predict risk
* Clustering helps identify patient segments

---

## 🧾 Conclusion

This project demonstrates how **Business Intelligence and Machine Learning** can be integrated to:

* Analyze healthcare data
* Predict patient risk
* Provide interactive and actionable insights

---

## 🎤 Author

**PK PRAJHAN**

---

## ⭐ If you like this project

Give it a ⭐ on GitHub!
