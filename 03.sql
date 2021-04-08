SELECT *
FROM region
WHERE province != city
ORDER BY elementary_school_count DESC
LIMIT 0, 3;
