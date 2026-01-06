SELECT first_name, last_name, team_code
FROM common_player_info
WHERE greatest_75_flag = 'Y' AND rosterstatus = 'Active';

SELECT team_name_home AS 'team_name', COUNT(wl_home) AS 'home_wins'
FROM game
WHERE wl_home = 'W'
GROUP BY team_name_home 
ORDER BY home_wins DESC;

SELECT team_name_away AS team_name, COUNT(wl_away) AS away_wins
FROM game
WHERE wl_away = 'W'
GROUP BY team_name_away
ORDER BY away_wins DESC;

SELECT team_name_home AS team_name, SUM(plus_minus_home) AS home_plus_minus
FROM game
GROUP BY team_name_home 
ORDER BY home_plus_minus DESC;

SELECT team_name_away AS team_name, SUM(plus_minus_away) AS away_plus_minus
FROM game
GROUP BY team_name_away
ORDER BY away_plus_minus DESC;

SELECT dh.player_name, cpi.season_exp, cpi.draft_year, cpi.rosterstatus 
FROM draft_history dh
	JOIN common_player_info cpi ON dh.person_id = cpi.person_id
WHERE overall_pick ='1'
ORDER BY cpi.season_exp, cpi.draft_year 

