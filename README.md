# Student Mental Health Analysis with SQL

## Project Overview
- **Project Title:** Student Mental Health Analysis
- **Level:** Beginner to Intermediate
- **Database:** student_mental_health

This project investigates factors influencing student mental health using SQL.
By analyzing survey data, we extract insights on depression, support systems, age groups, international vs domestic student trends, and mental health challenges.

It is ideal for analysts seeking to practice SQL concepts such as database setup, filtering, aggregation, reporting, and healthcare data analysis.
![a-detailed-pencil-sketch-depicting-a-div_2il3HiTjQZ2I-V2Zyz2lWA_5glPkPH-TlqCkVBuat3TAQ](https://github.com/user-attachments/assets/2dcfc02c-fc10-4a42-9e20-7ef08c7db3ba)


---
## Objectives
- Set up the student_mental_health database and load mental health survey data.
- Perform data cleaning and exploratory analysis.
- Analyze depression rates, suicidal ideation, support systems, and demographic factors.
- Generate findings that inform mental health interventions and policies.

---
## Project Structure
### 1. Database Setup
```SQL
DROP DATABASE IF EXISTS student_mental_health;
CREATE DATABASE student_mental_health;
USE student_mental_health;
```
Dataset: mental_health_data.csv 
---
### 2. Data Exploration & Basic Retrieval
### 2.1 Load the data and create table
```sql
CREATE TABLE mental_health_data (
  `index` INT,
  inter_dom VARCHAR(30),
  region VARCHAR(30),
  gender VARCHAR(10),
  academic VARCHAR(15),
  age INT,
  age_cate INT,
  stay INT,
  stay_cate VARCHAR(15),
  japanese INT,
  japanese_cate VARCHAR(20),
  english INT,
  english_cate VARCHAR(20),
  intimate VARCHAR(10),
  religion VARCHAR(10),
  suicide VARCHAR(10),
  dep VARCHAR(10),
  deptype VARCHAR(10),
  todep INT,
  depsev VARCHAR(10),
  tosc INT,
  apd INT,
  ahome INT,
  aph INT,
  afear INT,
  acs INT,
  aguilt INT,
  amiscell INT,
  toas INT,
  partner INT,
  friends INT,
  parents INT,
  relative INT,
  profess INT,
  phone INT,
  doctor INT,
  reli INT,
  alone INT,
  others INT,
  internet INT,
  partner_bi VARCHAR(5),
  friends_bi VARCHAR(5),
  parents_bi VARCHAR(5),
  relative_bi VARCHAR(5),
  professional_bi VARCHAR(5),
  phone_bi VARCHAR(5),
  doctor_bi VARCHAR(5),
  religion_bi VARCHAR(5),
  alone_bi VARCHAR(5),
  others_bi VARCHAR(5),
  internet_bi VARCHAR(5)
```
---
### 3. Key Analysis Tasks and Queries
### PROBLEM 1: How many students participated in the survey?
```sql
SELECT COUNT(*) AS total_stud
FROM mental_health_data;
```
---
###  PROBLEM 2: What percentage of the students are international vs domestic?
```SELECT inter_dom, COUNT(*) * 100 / (SELECT COUNT(*) FROM mental_health_data) AS percentage
FROM mental_health_data
GROUP BY inter_dom;
```
---
### PROBLEM 3: How many students reported symptoms of depression?
``` sql
SELECT dep, COUNT(*)
FROM mental_health_data
WHERE dep = "Yes";
```
---
### PROBLEM 4: What is the average age of students grouped by gender?
```sql
SELECT *
FROM mental_health_data;
SELECT gender, avg(age) AS Average_age
FROM mental_health_data
GROUP BY gender;
```
---

### PROBLEM 5: Which religions had the highest and lowest reported depression rates?
```sql
SELECT religion,
       COUNT(*) AS total,
       SUM(CASE WHEN dep = 'Yes' THEN 1 ELSE 0 END) AS depressed,
       ROUND(SUM(CASE WHEN dep = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS depression_rate
FROM mental_health_data
GROUP BY religion
ORDER BY depression_rate DESC;
```
---
### PROBLEM 6: What is the average depression score (todep) among students with high vs low English proficiency?
```sql
SELECT english_cate, ROUND(AVG(todep), 2) AS avg_depression_score
FROM mental_health_data
GROUP BY english_cate;
```
---

### PROBLEM 7: Is there any trend between duration of stay (stay_cate) and average depression score?
```sql
SELECT stay_cate, ROUND(AVG(todep), 2) AS avg_depression_score, COUNT(*) AS student_count
FROM mental_health_data
GROUP BY stay_cate
ORDER BY stay_cate; -- OBSERVE THERE IS NO LINEAR CORRELATION;
```

---
### PROBLEM 8: Which support systems (partner, parents, religion, doctor, internet) are associated with lower average depression scores?
```sql
SELECT
    'Partner' AS support_type, AVG(todep) AS avg_score
FROM mental_health_data WHERE partner_bi = 'Yes'
UNION
SELECT 'Parents', AVG(todep) FROM mental_health_data WHERE parents_bi = 'Yes'
UNION
SELECT 'Religion', AVG(todep) FROM mental_health_data WHERE religion_bi = 'Yes'
UNION
SELECT 'Doctor', AVG(todep) FROM mental_health_data WHERE doctor_bi = 'Yes'
UNION
SELECT 'Internet', AVG(todep) FROM mental_health_data WHERE internet_bi = 'Yes'
UNION
SELECT 'phone', AVG(todep) FROM mental_health_data WHERE phone_bi = 'Yes'
UNION
SELECT 'friends', AVG(todep) FROM mental_health_data WHERE friends_bi = 'Yes'
UNION
SELECT 'others', AVG(todep) FROM mental_health_data WHERE others_bi = 'Yes'
ORDER BY avg_score;
```

---
### PROBLEM 9: Among students who reported suicidal ideation, what is the average duration of stay and average depression score?
```sql
SELECT suicide, AVG(todep) AS avg_dep_score, AVG(stay) AS avg_stay
FROM mental_health_data
WHERE suicide = "Yes";
```
---
### PROBLEM 10: How many students reported having no support system (all _bi fields = 'No')?
```sql
SELECT COUNT(*) AS unsupported_students
FROM mental_health_data
WHERE partner_bi = 'No'
  AND friends_bi = 'No'
  AND parents_bi = 'No'
  AND relative_bi = 'No'
  AND professional_bi = 'No'
  AND phone_bi = 'No'
  AND doctor_bi = 'No'
  AND religion_bi = 'No'
  AND alone_bi = 'No'
  AND others_bi = 'No'
  AND internet_bi = 'No';
```

---
  ## How to Use
- **Clone the Repository:** Download or clone this project repository from GitHub.
- **Set Up the Database:** Run the SQL scripts provided in the section 1.0 of the COMPETITIVE WRITING.sql file to create the database.
- **Download and import dataaset**: Download the 'UNEG RECRUITMENT 2024&2025.csv' file. Import the dataset using the data import wizard in MySQL
-  **Run the Queries:** Use the SQL queries provided in the COMPETITIVE WRITING.sql file to perform your analysis.
-   **Explore and Modify:** Feel free to adjust queries to answer new business questions or perform deeper analysis.
---
## 👨💻 Author 
- Lorreta Anyika @ ALU DATATOK
- This project is part of the ALU DATATOK portfolio, showcasing the essential SQL skills every data analyst should master. If you have any questions, feedback, or would like to collaborate, feel free to get in touch!
 ---
## 🌐 Stay Updated and Join Our Community For more content on SQL, data analysis, and related fields, connect with ALU DATATOK: 
- **YouTube:** [Youtube](https://www.youtube.com/channel/UCQL3Wg_j3D5TWtn6ticnTsg) Subscribe for tutorials and insights
- **LinkedIn:** [LinkedIn](https://www.linkedin.com/in/uchechukwu-lorreta-anyika-7b5b4a253/) Connect professionally
-  **WhatsApp:** [WhatsApp](https://chat.whatsapp.com/LhAFCcplWbf0MYfyShJTgf) Gain access to peers and resources
Thank you for your support — we look forward to learning and growing with you! 🚀 
