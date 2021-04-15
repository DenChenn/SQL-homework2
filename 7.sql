SELECT player_attributes.preferred_foot, ROUND(AVG(player_attributes.long_shots), 2) AS avg_long_shots

FROM player_attributes
WHERE player_attributes.date IN (
    SELECT match_info.date
    FROM match_info
    WHERE match_info.season = '2015/2016' 
    AND
    match_info.country_id IN (
        SELECT league.country_id
        FROM league
        WHERE league.name = 'Italy Serie A'
    )
)
GROUP BY player_attributes.preferred_foot
