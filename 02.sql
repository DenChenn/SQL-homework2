SELECT *
FROM patient_info
WHERE age < 30 AND sex = "male" AND province = "Seoul" AND city = "Gangnam-gu"
ORDER BY infection_case ASC;
