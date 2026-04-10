# HR Analytics: Employee Attrition & Retention

## Project Overview
This project explores the **IBM HR Analytics Employee Attrition & Performance dataset** to identify the key drivers behind employee turnover. The goal is to move beyond simple descriptive statistics and build a robust, relational data architecture to answer complex business questions regarding income, departmental parity, and psychological satisfaction.

## 🛠️ Tech Stack
* **Python (Pandas / NumPy):** Data cleaning, slicing, and normalization.
* **PostgreSQL (Supabase):** Relational database architecture, Joins, CTEs (Common Table Expressions), and Exploratory Data Analysis (EDA).
* **Git/GitHub:** Version control.

## Data Architecture & Engineering
The original dataset was a flat, denormalized `.csv` file. To simulate a real-world corporate environment, the data was processed via Python and split into three normalized relational tables linked by a Primary Key (`EmployeeNumber`):

1. `demografic_df`: Personal employee data (Age, Education, Gender, etc.).
2. `workInfo_df`: Corporate metrics (Department, MonthlyIncome, JobRole, Attrition).
3. `workPerception_df`: Psychological and environmental assessments (JobSatisfaction, WorkLifeBalance, etc.).

### Sample Data Structure (workInfo_df)
*Note: Raw data files are excluded from this repository to maintain a lightweight architecture. The data is securely modeled in a PostgreSQL cloud instance.*

| EmployeeNumber | Department | MonthlyIncome | Attrition |
| :--- | :--- | :--- | :--- |
| 1 | Sales | 5993 | Yes |
| 2 | Research & Development | 5130 | No |
| 4 | Research & Development | 2090 | Yes |

## Key Business Insights (Exploratory Analysis)

Our primary SQL analysis aimed to test the hypothesis: *"Do employees leave strictly because of low wages?"*

Using advanced SQL queries (`INNER JOIN`, `Window Functions`, and `CTEs`), we discovered a nuanced reality:
1. **The General Trend:** On average, employees who left the company (`Attrition = 'Yes'`) had a significantly lower Monthly Income compared to those who stayed.
2. **The "Smoking Gun" (Cultural vs. Financial Turnover):** By calculating the actual moving average of income per Department, we isolated a specific group of employees who left **despite earning above their department's average**. 
3. **Conclusion:** For this specific high-earning group, financial compensation was neutralized as the primary turnover driver. The root cause points toward cultural and psychological factors (Environment Satisfaction, Work-Life Balance), highlighting the need for targeted retention strategies beyond salary bumps.

## Next Steps
* Export the aggregated views from PostgreSQL back to Python.
* Apply Inferential Statistics (T-tests, Mann-Whitney) to validate the statistical significance of the income differences between the attrition groups.