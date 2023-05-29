	create table if not exists team (
		name varchar(20) not null primary key,
		arena varchar(30) not null ,
		description text,
		home_wins smallint not null,
		away_wins smallint not null,
		home_losses smallint not null,
		away_losses smallint not null,
		home_draws smallint not null,
		away_draws smallint not null);
	
	create table  if not exists  player(
		name varchar(10) not null ,
		last_name varchar(10) not null,
		team varchar(20) not null references team(name),
		player_position varchar(20) not null,
		minutes smallint not null,
		id serial primary key);
		
	create table if not exists manager(
		name varchar(10) not null ,
		last_name varchar(10) not null,
		team varchar(20) not null references team(name),
		past_position varchar(20) not null,
		total_minutes int,
		id serial primary key);

	
	create table if not exists match(
		home_team varchar(20) not null references team (name),
		visiting_team varchar(20) not null references team (name),
		home_score smallint not null,
		visiting_score smallint not null,
		date date not null,
		id serial primary key);


	create table if not exists game_event(
   		event_type varchar(30) not null,
    		player_id integer not null references player(id)  ,
    		match_id integer not null references match(id),
    		event_time time not null,
    		id serial primary key);
		
	create table if not exists minutes_per_match(
	duration integer not null,
	player_id integer not null references player(id),
	match_id integer not null references match(id),
	id serial primary key);
