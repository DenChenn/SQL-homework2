SELECT 
    top5_winner.name AS team_long_name,
    ROUND(((SUM(hwin_value.score) + SUM(awin_value.score)) / (COUNT(hwin_value.id) + COUNT(awin_value.id))), 2) avg_win_score
FROM 
(
    SELECT 
        tm.name AS name,
        home.id AS id,
        (home.score + away.score) / (home.num_of_matches + away.num_of_matches) AS win_score

    FROM /*一次選擇三個table*/
    (
        SELECT 
            home_team_id AS id,
            SUM(CASE WHEN (home_team_score > away_team_score) THEN 2
            WHEN (home_team_score < away_team_score) THEN 0
            ELSE 1 END) AS score,
            COUNT(*) num_of_matches
        FROM match_info
        WHERE season = "2015/2016"
        GROUP BY home_team_id
        ORDER BY home_team_id
    ) home,
      
    (
        SELECT 
            away_team_id id,
            SUM(CASE WHEN (home_team_score > away_team_score ) THEN 0
                WHEN (home_team_score < away_team_score) THEN 2
                ELSE 1 END) AS score,
            COUNT(*) num_of_matches
        FROM match_info
        WHERE season = "2015/2016"
        GROUP BY away_team_id
        ORDER BY away_team_id ASC
    ) away,
      
    (
        SELECT 
            id,
            team_long_name AS name
        FROM team
    ) tm
      
    WHERE home.id = away.id
    AND tm.id = home.id
    ORDER BY win_score DESC
    LIMIT 7
) top5_winner,
    
(
    SELECT 
        home_team_id AS id, 
        (home_team_score - away_team_score) AS score
    FROM match_info
    WHERE season = "2015/2016"
) hwin_value,
(
    SELECT 
        away_team_id AS id, 
        (away_team_score - home_team_score) AS score
    FROM match_info
    WHERE season = "2015/2016"
) awin_value

WHERE hwin_value.id = top5_winner.id
AND awin_value.id = top5_winner.id
GROUP BY top5_winner.id
ORDER BY top5_winner.win_score DESC;