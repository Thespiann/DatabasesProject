--Ερώτημα 2α
SELECT manager.name , manager.last_name
FROM manager
JOIN team ON team.name=manager.team
JOIN match ON (team.name=match.home_team )--ή θα μπορούσε να είναι : team.name=match.visiting_team
WHERE match.id=3

--Ερώτημα 2β
