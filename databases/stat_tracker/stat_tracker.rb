# Statistics Tracker [Basketball Tourney Ed.]

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
		Opp_team VARCHAR (255)
	);
SQL

user_table = <<-SQL
	CREATE TABLE IF NOT EXISTS users(
		Username VARCHAR (255)
	);
SQL



# create (players, opponents) tables by calling execute on the database:
@basketballdb.execute(players_table)
@basketballdb.execute(opponents_table)
@basketballdb.execute(user_table)

# create methods to populate (players, opponents) tables before creating stats table
# enter player:
def entering_player(basketballdb, team, name)
	  basketballdb.execute("INSERT INTO players (team, name) VALUES (?, ?)", [team, name])
end
# enter opponent:
def entering_opponent(basketballdb, opp_team)
	  basketballdb.execute("INSERT INTO opponents (opp_team) VALUES (?)", [opp_team])
end

def users(basketballdb, username)
	basketballdb.execute("INSERT INTO users (username) VALUES (?)", [username])
end

def array_users
	@all_users= []
	users = @basketballdb.execute("select username from users")
	users.each { |hash| @all_users << hash["Username"]}
	@all_users
end
	array_users

####USER INTERFACE####
puts "Welcome to Statistics Tracker!"
puts "Please enter administrator's name:"
username = gets.chomp.split.map(&:capitalize).join(' ')
if array_users.include?(username)
	puts "\nWelcome back to Statistics Tracker, #{username}!"
	puts "Enter 'Y' to add more teams or 'N' to edit/view previous stats."
else
	users(@basketballdb, username)
	puts "\nWelcome to Statistics Tracker!"
	puts "\nLet's get you started #{username}.."
	puts "Please input all teams participating in the tournament."
	puts "\nEnter 'Y' to continue or 'N' to edit/view previous stats"
end

def add_teams
	input = ""
	@teams = []

	while input != "N"
	input = gets.chomp.capitalize
		
		if input == "Y"
			puts "\nPlease enter team:"
			@team_name = gets.chomp.split.map(&:capitalize).join(' ')
			@teams << @team_name
			puts "\nTeams added:"
			@teams.each { |team| puts "#{team}" }
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
	puts "-------------------------------------------------------"

	@teams.each do |opp_team|
		entering_opponent(@basketballdb, opp_team)
	end
	end


def player_input
	puts "\nPlease select team to add roster to:"
	@teams.each { |team| puts "*#{team}" }
	@team = gets.chomp.split.map(&:capitalize).join(' ')
	@roster = []


	if @teams.include?(@team) == false
	input = ""
		puts "\nThat team is not listed, please select team from list"
	else
		puts "\nYou have selected #{@team}, would you like to continue? 'Y' or 'N'."

while input != "N"
input = gets.chomp.capitalize
	
	if input == "Y"
		puts "\nPlease add player to the #{@team}' roster:"
		@name = gets.chomp.split.map(&:capitalize).join(' ')
		@roster << @name
		puts "\nPlayers added to the #{@team}' Roster:"
		@roster.each { |name| puts "*#{name}" }
		puts "\nWould you like to add another player to the #{@team}'s roster? 'Y' or 'N'."
	elsif input == "N"
		puts "\nYou have finished entering the roster for the #{@team}."
		puts "\nTeams and rosters are now set!"
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
		Points int,
		Rebounds int,
		Assists int,
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



# make method to make a player => id hash
def player_id
	@id_hash = {}
	@rosters = @basketballdb.execute("select *from players")
	@rosters.each { |hash| @id_hash[hash[2]] = hash[0] }
	@id_hash
end
player_id

# make method to make a oppenent => id hash
def opponent_id
	@opp_hash = {}
	@opponent = @basketballdb.execute("select *from opponents")
	@opponent.each { |hash| @opp_hash[hash[1]] = hash[0] }
	@opp_hash
end
opponent_id

def stats_input

	puts "\nTo enter stats, first choose a team. "
	@teams.each { |team| puts "*#{team}" }
	chosen_team = gets.chomp.split.map(&:capitalize).join(' ')

		if @teams.include?(chosen_team) == false
		input = ""
			puts "\nThat team is not listed, please select team from list"
			@teams.each { |team| print "(#{team})" }
		else
			puts "\nYou have selected #{chosen_team} to add stats to, would you like to continue? 'Y' or 'N'."
	while input != "N"
	input = gets.chomp.capitalize

		if input == "Y"
			puts "Select their opponent:"
			opponent_input = gets.chomp.split.map(&:capitalize).join(' ')
			opponent_id  = @opp_hash[opponent_input]
			#roster = @roster_players[chosen_team]
			#puts "Here is the roster: #{roster}"
			puts "\nPlease select a player on the #{chosen_team}."
			player = gets.chomp.split.map(&:capitalize).join(' ')
			player_id = @id_hash[player]
			puts "Enter total points:"
			points = gets.chomp.to_i
			puts "Enter total rebounds:"
			rebounds = gets.chomp.to_i
			puts "Enter total assists:"
			assists = gets.chomp.to_i
			entering_stats(@basketballdb, points, rebounds, assists, player_id, opponent_id)
			puts "Would you like to continue adding stats for the #{chosen_team}? 'Y' or 'N'."
			elsif input == "N"
			puts "\nYou have finished entering stats for all players on #{chosen_team}."
			puts "-------------------------------------------------------"
			break
		else
			puts "Error: request denied"
			puts "Would you like to continue adding stats to the #{chosen_team}? 'Y' or 'N'."
		end
	end
	end
	end
 @teams.length.times { stats_input } 


#create all_players method for view_stats 
def all_players
	@all_players = []
	players = @basketballdb.execute("select name from players")
	players.each { |hash| @all_players << hash["Name"]}
end
all_players

def view_stats
puts "To view the stats, please select a player or type 'Exit' to exit program"
player_stat = gets.chomp.split.map(&:capitalize).join(' ')
player_id = @id_hash[player_stat]

	while @all_players.include?(player_stat) != false


		if @all_players.include?(player_stat) == true
			puts "Select opponent you would like to see #{player_stat}'s stats against:"
			#also add, something if they havent played opponent
			opp = gets.chomp.split.map(&:capitalize).join(' ')
			opp_id = @opp_hash[opp]
			stats = @basketballdb.execute("SELECT stats.points, stats.rebounds, stats.assists, opponents.opp_team FROM players JOIN stats ON players.id=stats.player_id JOIN opponents ON opponents.id=stats.opponent_id WHERE players.id = #{player_id} and opponent_id = #{opp_id}")
			stats.each { |hash| puts "#{player_stat}'s stats against the #{hash[3]}:\nPoints: #{hash[0]}\nRebounds: #{hash[1]}\nAssists: #{hash[2]}" }
			puts "Would you like to view another? 'Y' or 'N'."
			input = ""
			input = gets.chomp.capitalize
				if input == "Y"
				puts "\nPlease select another player:"
				player_stat = gets.chomp.split.map(&:capitalize).join(' ')
			    player_id = @id_hash[player_stat]
				elsif input == "N"
				break
				end
		elsif input == "N"
			puts "\n You are finished viewing, thank you!"
			break
		else
			puts "Error: request denied"
			puts "Please select another player."
		end
	end
end

view_stats









#show player's opponents
#select opponent
#if they havent played, put in error
#would you like to edit stats?



#@basketballdb.execute("select * from opponents")


