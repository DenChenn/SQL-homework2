SELECT region.province, region.city, max_confirmed, date, elderly_population_ratio
FROM region
RIGHT OUTER JOIN (
    SELECT date, time_province.province, max_confirmed
    FROM time_province
    RIGHT OUTER JOIN (
        SELECT province, MAX(confirmed) AS max_confirmed
        FROM time_province
        GROUP BY province
    ) most_confirmed
    ON time_province.province = most_confirmed.province AND 
    time_province.confirmed = most_confirmed.max_confirmed
) confirmed_date_result
ON region.province = confirmed_date_result.province
WHERE region.province = region.city AND region.elderly_population_ratio >
(SELECT AVG(elderly_population_ratio) FROM region WHERE region.province = region.city)

