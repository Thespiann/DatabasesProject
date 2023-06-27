insert into manager (name, last_name, team, past_position, total_minutes) values ('Αθανάσιος', 'Κεδίκογλου', 'AEK', 'Attacking Midfielder', 20491);
insert into manager (name, last_name, team, past_position, total_minutes) values ('Λεωνίδας', 'Τσουκαλάς', 'Panathinaikos', 'Attacking Midfielder', 8919);
insert into manager (name, last_name, team, past_position, total_minutes) values ('Λεωνίδας', 'Φανουράκης', 'PAOK', 'Center Back', 18034);
insert into manager (name, last_name, team, past_position, total_minutes) values ('Ιωσήφ', 'Γιαλαμάς', 'Olympiacos', 'Center Back', 13727);
insert into manager (name, last_name, team, past_position, total_minutes) values ('Δήμος', 'Κεχαγιάς', 'Aris', 'Attacking Midfielder', 28215);
insert into manager (name, last_name, team, past_position, total_minutes) values ('Κλεάνθης', 'Φωτόπουλος', 'Volos', 'Right Back', 22881);

--function to insert manager using user:
CREATE OR REPLACE FUNCTION promote_to_manager(player_id INT)
RETURNS VOID AS $$
DECLARE
    total_minutes INTEGER;
BEGIN
    -- Calculate the total_minutes
    SELECT COALESCE(SUM(duration), 0)
    INTO total_minutes
    FROM minutes_per_match
    WHERE player_id = player_id;

    -- Insert into the manager table
    INSERT INTO manager (name, last_name, team, past_position, total_minutes)
    SELECT name, last_name, team, player_position, total_minutes
    FROM player
    WHERE id = player_id;

    -- Delete from the player table
    DELETE FROM player WHERE id = player_id;
END;
$$ LANGUAGE plpgsql;
