--Ερώτημα 2α
SELECT manager.name , manager.last_name
FROM manager
JOIN team ON team.name=manager.team
JOIN match ON (team.name=match.home_team )--ή θα μπορούσε να είναι : team.name=match.visiting_team
WHERE match.id=3

--Ερώτημα 2β
SELECT game_event.event_type, game_event.event_time, player.name AS player_name
FROM game_event
JOIN player ON game_event.player_id = player.id
JOIN match on game_event.match_id = match.id
WHERE match.id = '5' AND (game_event.event_type = 'goal' OR game_event.event_type = 'penalty kick');

--Ερώτημα 2γ
