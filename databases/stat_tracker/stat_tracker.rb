# Statistics Tracker [Basketball Tourney: Knicks, Nets, Cavs, Warriors]

# require database gem
require 'sqlite3'

# create database
@basketballdb = SQLite3::Database.new("basketball.db")
# deliver data as a hash data structure (formula found on sql docs)
@basketballdb.results_as_hash = true

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
@basketballdb.execute(players_table)
@basketballdb.execute(opponents_table)

# create methods to populate (players, opponents) tables before creating stats table
# enter player:
def entering_player(basketballdb, team, name)
	  basketballdb.execute("INSERT INTO players (team, name) VALUES (?, ?)", [team, name])
end
# enter opponent:
def entering_opponent(basketballdb, team_name)
	  basketballdb.execute("INSERT INTO opponents (team_name) VALUES (?)", [team_name])
end


####USER INTERFACE####
puts "Welcome to Statistics Tracker!"
puts "Please enter administrator's name:"
@admin = gets.chomp.capitalize
puts "\nLet's get you started #{@admin}.."

def add_teams
	puts "Please enter all teams participating in your tournament."
	puts "Would you like to continue? Enter: 'Y' or 'N'"
	input = ""
	@teams = []


	while input != "N"
	input = gets.chomp.capitalize
		
		if input == "Y"
			puts "\nPlease enter team:"
			@team_name = gets.chomp.capitalize
			@teams << @team_name
			puts "\nWould you like to add another team? 'Y' or 'N'"
		elsif input == "N"
			puts "You have finished entering all participating teams."
			break
		else
			puts "Error: request denied"
			puts "Would you like to add another team? 'Y' or 'N'"
		end
	end
	puts "\nHere is a list of participating teams you have entered:"
	@teams.each { |team| puts "#{team} - (TEAM #{@teams.index(team)+1})" }

	@teams.each do |team_name|
		entering_opponent(@basketballdb, team_name)
	end
	end


def player_input
	puts "\n#{@admin}, please select team to add roster to:"
	@teams.each { |team| print "(#{team})" }
	@team = gets.chomp.capitalize
	roster_inp = ""
	@roster = []
	@player_team = {}


	if @teams.include?(@team) == false
	input = ""
		puts "\nThat team is not listed, please select team from list"
	else
		puts "\nYou have selected #{@team}, would you like to continue? 'Y' or 'N'."

while input != "N"
input = gets.chomp.capitalize
	
	if input == "Y"
		puts "\nPlease enter player's name for the #{@team}:"
		@name = gets.chomp.capitalize
		@roster << @name
		puts "\nThe #{@team} Roster:"
		@roster.each { |name| puts "#{name}" }
		@player_team[@name] = @team
		puts "\nWould you like to add another player to the #{@team}'s roster? 'Y' or 'N'."
	elsif input == "N"
		puts "You have finished entering the roster for the #{@team}."
		break
	else
		puts "Error: request denied"
		puts "Would you like to add another player to the #{@team}'s roster? 'Y' or 'N'."
	end
end
end
@roster.each do |name|
	entering_player(@basketballdb, @team, name)
end
end

# #call methods
add_teams
@teams.length.times { player_input }


stats_table = <<-SQL
	CREATE TABLE IF NOT EXISTS stats(
		ID INTEGER PRIMARY KEY,
		points int,
		rebounds int,
		assists int,
		player_id int,
		opponent_id int,
		foreign key (player_id) references players(id),
		foreign key (opponent_id) references opponents(id)
	);
SQL

@basketballdb.execute(stats_table)



def entering_stats(basketballdb, points, rebounds, assists, player_id, opponent_id)
	  basketballdb.execute("INSERT INTO stats (points, rebounds, assists, player_id, opponent_id) 
	  	VALUES (?, ?, ?, ?, ?)", [points, rebounds, assists, player_id, opponent_id])
end



# make method to make a player => team hash
def set_rosters
	@id_hash = {}
	@rosters = @basketballdb.execute("select *from players")
	@rosters.each do |hash| @id_hash[hash[2]] = hash[0] end
	@id_hash
end
set_rosters


def stats_input
	puts "\nTeams and rosters are now set!"
	puts "\nTo enter stats, first choose a team. "
	@teams.each { |team| print "(#{team})" }
	chosen_team = gets.chomp.capitalize
	opponent_id = @teams.index(chosen_team)+1


		if @teams.include?(chosen_team) == false
		input = ""
			puts "\nThat team is not listed, please select team from list"
			@teams.each { |team| print "(#{team})" }
		else
			puts "\nYou have selected #{chosen_team}, would you like to continue? 'Y' or 'N'."
	while input != "N"
	input = gets.chomp.capitalize

		if input == "Y"
			puts "here is the roster: #{@roster}"
			puts "\nPlease select a player on the #{chosen_team}."
			player = gets.chomp.capitalize
			player_id = @id_hash[player]
			p player_id
			puts "Enter total points:"
			points = gets.chomp.to_i
			puts "Enter total rebounds:"
			rebounds = gets.chomp.to_i
			puts "Enter total assists:"
			assists = gets.chomp.to_i
			entering_stats(@basketballdb, points, rebounds, assists, player_id, opponent_id)
			puts "Would you like to continue adding stats to the #{chosen_team}? 'Y' or 'N'."
			elsif input == "N"
			puts "You have finished entering stats for all players on #{chosen_team}."
			break
		else
			puts "Error: request denied"
			puts "Would you like to continue adding stats to the #{chosen_team}? 'Y' or 'N'."
		end
	end
	end
	end


 @teams.length.times { stats_input } 



# players = @basketballdb.execute("select * from opponents")
# p players
# players.object
#4/22 created database, now we can create input to add stats 



