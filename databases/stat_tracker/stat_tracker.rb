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
# enter player:
def entering_player(basketballdb, team, name)
	  basketballdb.execute("INSERT INTO players (team, name) VALUES (?, ?)", [team, name])
end
# enter opponent:
def entering_opponent(basketballdb, team_name)
	  basketballdb.execute("INSERT INTO opponents (team_name) VALUES (?)", [team_name])
end

# ####USER INTERFACE####
# input =""
# 	puts "Would you like to 'add' or 'view' statistics?"
# 	input = gets.chomp
	
# # create method to gather team name:
# def team
# 	puts "\nPlease enter player's team:"		
# 	team = gets.chomp.capitalize
# end
# # create method to gather player full name:
# def name
# 		puts "Then, enter player's first name:"
# 		first = gets.chomp.capitalize
# 	puts "Finally, enter player's last name:"
# 		last = gets.chomp.capitalize
		
# 		name = first+" "+last
# end

####USER INTERFACE####
puts "Would you like to 'add' or 'view' statistics?"
input =""

while input != "view"
	input = gets.chomp

	if input == "add"

		puts "Please enter player's team:"		
		team = gets.chomp.capitalize
	
		puts "Then, enter player's first name:"
		first = gets.chomp.capitalize
		
		puts "Finally, enter player's last name:"
		last = gets.chomp.capitalize
		name = first+" "+last

		puts "Enter opponent:"
		team_name = gets.chomp
		
	else
		puts "press anything to end"
		break
	end
end
# plug input in to create tables:
entering_player(basketballdb, team, name)
entering_opponent(basketballdb, team_name)

