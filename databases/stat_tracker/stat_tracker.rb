# Statistics Tracker [Basketball Tourney]

# require database gem
require 'sqlite3'

# create database
basketballdb = SQLite3::Database.new("basketball.db")
# deliver data as a hash data structure (formula found on sql docs)
basketballdb.results_as_hash = true

# create 3 variables in order to create tables in database for: players, stats, opponents
# players variable:
players_table = <<-SQL
	CREATE TABLE IF NOT EXISTS players(
		ID INTEGER PRIMARY KEY,
		Team VARCHAR (255),
		Name VARCHAR (255)
	);
SQL
# opponents variable:
opponents_table = <<-SQL
	CREATE TABLE IF NOT EXISTS opponents(
		ID INTEGER PRIMARY KEY,
		Team_name VARCHAR (255)
	);
SQL

# create (players, opponents) tables by calling execute on the database:
basketballdb.execute(players_table)
basketballdb.execute(opponents_table)

# create methods to populate (players, opponents) tables before creating stats table
def enter_player(db, team, name)
	  db.execute("INSERT INTO players (team, name) VALUES (?, ?)", [team, name])
end
