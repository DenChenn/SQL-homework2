SET @avg = (
    SELECT AVG(coronavirus)
    FROM search_trend
);

SET @std = (
    SELECT STD(coronavirus)
    FROM search_trend
    WHERE date BETWEEN '2019-12-25' AND '2020-06-29' 
);

SELECT 
    date, 
    ROUND(coronavirus, 2) AS coronavirus, 
    now_confirmed AS confirmed_accumulate,
    (now_confirmed - last_confirmed) AS confirmed_add,
    now_deceased AS dead_accumulate,
    (now_deceased - last_deceased) AS dead_add
FROM
(
    SELECT result.date, result.coronavirus, now_confirmed, now_deceased

    FROM (
        SELECT date, coronavirus
        FROM search_trend
        WHERE coronavirus > (@avg + 2 * @std)
    ) result

    LEFT OUTER JOIN (
        SELECT date, confirmed AS now_confirmed, deceased AS now_deceased
        FROM time
    ) now_time
    ON now_time.date = result.date
) combine


LEFT OUTER JOIN (
    SELECT date AS last_date, confirmed AS last_confirmed, deceased AS last_deceased
    FROM time
) last_time
ON last_time.last_date = DATE_SUB(combine.date, INTERVAL 1 DAY);




