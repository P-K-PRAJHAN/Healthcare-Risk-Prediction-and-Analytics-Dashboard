CREATE DATABASE healthcare_db;
USE healthcare_db;
CREATE TABLE patients (
    id INT AUTO_INCREMENT PRIMARY KEY,
    age INT,
    chest_pain INT,
    shortness_of_breath INT,
    irregular_heartbeat INT,
    fatigue_weakness INT,
    dizziness INT,
    swelling INT,
    pain_areas INT,
    sweating INT,
    cough INT,
    nausea INT,
    high_bp INT,
    chest_discomfort INT,
    cold_extremities INT,
    snoring INT,
    anxiety INT,
    at_risk INT,
    stroke_risk FLOAT
);
SELECT COUNT(*) FROM patients;
SELECT * FROM patients LIMIT 10;
SELECT at_risk, COUNT(*) FROM patients GROUP BY at_risk;
CREATE TABLE fact_health (
    id INT,
    age INT,
    stroke_risk FLOAT,
    at_risk INT
);
INSERT INTO fact_health (id, age, stroke_risk, at_risk) SELECT id, age, stroke_risk, at_risk FROM patients;
SELECT * FROM fact_health LIMIT 10;
CREATE TABLE dim_age (
    age INT,
    age_group VARCHAR(20)
);
INSERT INTO dim_age (age, age_group) SELECT DISTINCT age, CASE
    WHEN age < 30 THEN 'Young'
    WHEN age BETWEEN 30 AND 60 THEN 'Middle'
    ELSE 'Senior'
END FROM patients;
SELECT * FROM dim_age LIMIT 10;
CREATE TABLE dim_risk (
    risk_label VARCHAR(20)
);
INSERT INTO dim_risk VALUES ('Low'), ('Medium'), ('High');
CREATE VIEW healthcare_view AS SELECT f.id, f.age, d.age_group, f.stroke_risk, f.at_risk FROM fact_health f JOIN dim_age d ON f.age = d.age;
SELECT * FROM healthcare_view LIMIT 10;
