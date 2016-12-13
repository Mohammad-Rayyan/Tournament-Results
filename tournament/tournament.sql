-- Table definitions for the tournament project.
--
-- Put your SQL 'create table' statements in this file; also 'create view'
-- statements if you choose to use it.
--
-- You can write comments in this file by starting them with two dashes, like
-- these lines here.

CREATE TABLE players (
 id serial PRIMARY KEY ,
 name text
);

CREATE TABLE matches (
 id serial PRIMARY KEY,
 winner integer references players (id),
 loser integer references players (id)
);

CREATE VIEW wins as 
	select players.id as a, count(matches.id) as wins from players left join matches on players.id = matches.winner group by players.id;

CREATE VIEW matches_c as
	select players.id as a, count(matches.id) as matches from players left join matches on players.id = matches.winner or players.id = matches.loser group by players.id;