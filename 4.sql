SELECT province, weather.code, COUNT(*) AS cnt
FROM weather 
LEFT OUTER JOIN region
ON weather.code = region.code
WHERE avg_relative_humidity > 70
GROUP BY weather.code
ORDER BY cnt DESC
LIMIT 0, 3








