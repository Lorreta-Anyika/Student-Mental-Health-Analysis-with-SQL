-- Healthcare Analysis

-- PROBLEM 1: How many students participated in the survey?
SELECT COUNT(*) AS total_stud
FROM mental_health_data;

-- PROBLEM 2: What percentage of the students are international vs domestic?
SELECT inter_dom, COUNT(*) * 100 / (SELECT COUNT(*) FROM mental_health_data) AS percentage
FROM mental_health_data
GROUP BY inter_dom;

-- PROBLEM 3: How many students reported symptoms of depression?
SELECT dep, COUNT(*)
FROM mental_health_data
WHERE dep = "Yes";

-- PROBLEM 4: What is the average age of students grouped by gender?
SELECT *
FROM mental_health_data;

SELECT gender, avg(age) AS Average_age
FROM mental_health_data
GROUP BY gender;

-- PROBLEM 5: Which religions had the highest and lowest reported depression rates?
SELECT *
FROM mental_health_data;

SELECT religion, count(religion)
FROM mental_health_data
GROUP BY religion;

SELECT religion,
       COUNT(*) AS total,
       SUM(CASE WHEN dep = 'Yes' THEN 1 ELSE 0 END) AS depressed,
       ROUND(SUM(CASE WHEN dep = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS depression_rate
FROM mental_health_data
GROUP BY religion
ORDER BY depression_rate DESC;

-- PROBLEM 6: What is the average depression score (todep) among students with high vs low English proficiency?
SELECT *
FROM mental_health_data;

SELECT english_cate, ROUND(AVG(todep), 2) AS avg_depression_score
FROM mental_health_data
GROUP BY english_cate;

-- PROBLEM 7: Is there any trend between duration of stay (stay_cate) and average depression score?
SELECT stay_cate, ROUND(AVG(todep), 2) AS avg_depression_score, COUNT(*) AS student_count
FROM mental_health_data
GROUP BY stay_cate
ORDER BY stay_cate; -- OBSERVE THERE IS NO LINEAR CORRELATION

-- PROBLEM 8: Which support systems (partner, parents, religion, doctor, internet) are associated with lower average depression scores?
SELECT *
FROM mental_health_data;

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

-- PROBLEM 10: Among students who reported suicidal ideation, what is the average duration of stay and average depression score?
SELECT *
FROM mental_health_data;

SELECT suicide, AVG(todep) AS avg_dep_score, AVG(stay) AS avg_stay
FROM mental_health_data
WHERE suicide = "Yes";

-- PROBLEM 10: How many students reported having no support system (all _bi fields = 'No')?
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


