
SELECT 
    league.name AS leagueName,
    (hp1.hp1_height + hp2.hp2_height + hp3.hp3_height + 
    hp4.hp4_height + hp5.hp5_height + hp6.hp6_height + 
    hp7.hp7_height + hp8.hp8_height + hp9.hp9_height + 
    hp10.hp10_height + hp11.hp11_height) / 11 AS avg_home_height,
    (ap1.ap1_height + ap2.ap2_height + ap3.ap3_height + 
    ap4.ap4_height + ap5.ap5_height + ap6.ap6_height + 
    ap7.ap7_height + ap8.ap8_height + ap9.ap9_height + 
    ap10.ap10_height + ap11.ap11_height) / 11 AS avg_away_height,
    match_info.home_team_score AS hts,
    match_info.away_team_score AS aws

FROM match_info
    LEFT OUTER JOIN league
    ON match_info.league_id = league.id

    LEFT OUTER JOIN (
        SELECT height AS hp1_height, player_api_id AS hp1_pad
        FROM player
    ) hp1
    ON match_info.home_player_1 = hp1.hp1_pad
    LEFT OUTER JOIN (
        SELECT height AS hp2_height, player_api_id AS hp2_pad
        FROM player
    ) hp2
    ON match_info.home_player_2 = hp2.hp2_pad
    LEFT OUTER JOIN (
        SELECT height AS hp3_height, player_api_id AS hp3_pad
        FROM player
    ) hp3
    ON match_info.home_player_3 = hp3.hp3_pad
    LEFT OUTER JOIN (
        SELECT height AS hp4_height, player_api_id AS hp4_pad
        FROM player
    ) hp4
    ON match_info.home_player_4 = hp4.hp4_pad
    LEFT OUTER JOIN (
        SELECT height AS hp5_height, player_api_id AS hp5_pad
        FROM player
    ) hp5
    ON match_info.home_player_5 = hp5.hp5_pad
    LEFT OUTER JOIN (
        SELECT height AS hp6_height, player_api_id AS hp6_pad
        FROM player
    ) hp6
    ON match_info.home_player_6 = hp6.hp6_pad
    LEFT OUTER JOIN (
        SELECT height AS hp7_height, player_api_id AS hp7_pad
        FROM player
    ) hp7
    ON match_info.home_player_7 = hp7.hp7_pad
    LEFT OUTER JOIN (
        SELECT height AS hp8_height, player_api_id AS hp8_pad
        FROM player
    ) hp8
    ON match_info.home_player_8 = hp8.hp8_pad
    LEFT OUTER JOIN (
        SELECT height AS hp9_height, player_api_id AS hp9_pad
        FROM player
    ) hp9
    ON match_info.home_player_9 = hp9.hp9_pad
    LEFT OUTER JOIN (
        SELECT height AS hp10_height, player_api_id AS hp10_pad
        FROM player
    ) hp10
    ON match_info.home_player_10 = hp10.hp10_pad
    LEFT OUTER JOIN (
        SELECT height AS hp11_height, player_api_id AS hp11_pad
        FROM player
    ) hp11
    ON match_info.home_player_11 = hp11.hp11_pad
    

    LEFT OUTER JOIN (
        SELECT height AS ap1_height, player_api_id AS ap1_pad
        FROM player
    ) ap1
    ON match_info.away_player_1 = ap1.ap1_pad
    LEFT OUTER JOIN (
        SELECT height AS ap2_height, player_api_id AS ap2_pad
        FROM player
    ) ap2
    ON match_info.away_player_2 = ap2.ap2_pad
    LEFT OUTER JOIN (
        SELECT height AS ap3_height, player_api_id AS ap3_pad
        FROM player
    ) ap3
    ON match_info.away_player_3 = ap3.ap3_pad
    LEFT OUTER JOIN (
        SELECT height AS ap4_height, player_api_id AS ap4_pad
        FROM player
    ) ap4
    ON match_info.away_player_4 = ap4.ap4_pad
    LEFT OUTER JOIN (
        SELECT height AS ap5_height, player_api_id AS ap5_pad
        FROM player
    ) ap5
    ON match_info.away_player_5 = ap5.ap5_pad
    LEFT OUTER JOIN (
        SELECT height AS ap6_height, player_api_id AS ap6_pad
        FROM player
    ) ap6
    ON match_info.away_player_6 = ap6.ap6_pad
    LEFT OUTER JOIN (
        SELECT height AS ap7_height, player_api_id AS ap7_pad
        FROM player
    ) ap7
    ON match_info.away_player_7 = ap7.ap7_pad
    LEFT OUTER JOIN (
        SELECT height AS ap8_height, player_api_id AS ap8_pad
        FROM player
    ) ap8
    ON match_info.away_player_8 = ap8.ap8_pad
    LEFT OUTER JOIN (
        SELECT height AS ap9_height, player_api_id AS ap9_pad
        FROM player
    ) ap9
    ON match_info.away_player_9 = ap9.ap9_pad
    LEFT OUTER JOIN (
        SELECT height AS ap10_height, player_api_id AS ap10_pad
        FROM player
    ) ap10
    ON match_info.away_player_10 = ap10.ap10_pad
    LEFT OUTER JOIN (
        SELECT height AS ap11_height, player_api_id AS ap11_pad
        FROM player
    ) ap11
    ON match_info.away_player_11 = ap11.ap11_pad
LIMIT 0, 1000