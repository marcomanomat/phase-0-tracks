# Statistics Tracker [Basketball Tournament Edition - Beta]

#Note: As a new user, please enter ALL teams, players, stats at once.
# can add new players, teams and stats to existing database
# cannot edit existing teams, players, and stats, yet

# require database gem
require 'sqlite3'

# create database
@basketballdb = SQLite3::Database.new("basketball.db")

# deliver data as a hash data structure (formula found on sql docs)
@basketballdb.results_as_hash = true

# create first 2 (out of 3) variables in order to create tables in database for: players, stats, opponents, users
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

# users variable:
user_table = <<-SQL
	CREATE TABLE IF NOT EXISTS users(
		Username VARCHAR (255)
	);
SQL

# create (players, opponents, users) tables by calling execute on the database:
@basketballdb.execute(players_table)
@basketballdb.execute(opponents_table)
@basketballdb.execute(user_table)

# create methods to populate (players, opponents, users) tables before creating stats table
# enter player:
def entering_player(basketballdb, team, name)
	basketballdb.execute("INSERT INTO players (team, name) VALUES (?, ?)", [team, name])
end
# enter opponent:
def entering_opponent(basketballdb, opp_team)
	basketballdb.execute("INSERT INTO opponents (opp_team) VALUES (?)", [opp_team])
end
# enter users:
def users(basketballdb, username)
	basketballdb.execute("INSERT INTO users (username) VALUES (?)", [username])
end


# create method to make an array for an ".include?" for the USER name input:
def array_users
	@all_users= []
	users = @basketballdb.execute("select username from users")
	users.each { |hash| @all_users << hash["Username"]}
	@all_users
end
	array_users



######## USER INTERFACE #######

# ask for user name; will add to user database if it is a new/unique username
puts "Welcome to Statistics Tracker!"
puts "Please enter USER's name:"
	username = gets.chomp.split.map(&:capitalize).join(' ')

if array_users.include?(username)
	puts "\nWelcome back to Statistics Tracker, #{username}!"
	puts "Enter 'Y' to add more teams or 'N' to view previous stats."

else
	users(@basketballdb, username)
	puts "\nWelcome to Statistics Tracker!"
	puts "\nLet's get you started #{username}.."
	puts "Please input all teams participating in the tournament."
	puts "\nEnter 'Y' to continue or 'N' to edit/view previous stats"
end


# create method for: populating opponents/(teams) table with a loop
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
			break

		else
			puts "Error: request denied"
			puts "Would you like to add another team? 'Y' or 'N'"
		end

	end
	@teams.each { |team| puts "#{team}" }
	puts "-------------------------------------------------------"
	# part of add_teams method where opponens table is being populated:
	@teams.each do |opp_team|
		entering_opponent(@basketballdb, opp_team)
	end

end


# create method for: populating players table with a loop
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
	# part of player_input method where players table is being populated:
	@roster.each do |name|
		entering_player(@basketballdb, @team, name)
	end

end
# call methods: add_teams, player_input (method's loop will run for how ever many teams are inputed)
add_teams
@teams.length.times { player_input }


# create method to populate stats last of tables (4 - total)
# stats variable:
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

# create stats table by calling execute on the database:
@basketballdb.execute(stats_table)


# create method to populate stats tables
# enter stats:
def entering_stats(basketballdb, points, rebounds, assists, player_id, opponent_id)
	  basketballdb.execute("INSERT INTO stats (points, rebounds, assists, player_id, opponent_id) 
	  	VALUES (?, ?, ?, ?, ?)", [points, rebounds, assists, player_id, opponent_id])
end



# create method to make a "player => id" hash
def player_id
	@id_hash = {}
	@rosters = @basketballdb.execute("select *from players")
	@rosters.each { |hash| @id_hash[hash[2]] = hash[0] }
	@id_hash
end
	player_id

# create method to make an "oppenent => id" hash
def opponent_id
	@opp_hash = {}
	@opponent = @basketballdb.execute("select *from opponents")
	@opponent.each { |hash| @opp_hash[hash[1]] = hash[0] }
	@opp_hash
end
	opponent_id

# create method to list all teams in database
def teams_list
	@teams_list = @basketballdb.execute("select Opp_team from opponents")
end 
	teams_list



# create method for: populating stats table with a loop
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

			puts "Select an opponent:"
			@teams_list.each { |hash| puts "*#{hash[0]}" }
			opponent_input = gets.chomp.split.map(&:capitalize).join(' ')
			opponent_id  = @opp_hash[opponent_input]

			puts "\nPlease select a player on the #{chosen_team}."
			@roster.each { |name| puts "*#{name}" }
			player = gets.chomp.split.map(&:capitalize).join(' ')
			player_id = @id_hash[player]

			puts "Enter total points:"
			points = gets.chomp.to_i

			puts "Enter total rebounds:"
			rebounds = gets.chomp.to_i

			puts "Enter total assists:"
			assists = gets.chomp.to_i
			# part of stats_input method where stats table is being populated:
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
# call method:
 @teams.length.times { stats_input } 

# create method to view which teams each player has played against
def vs_opp
	# creates a hash that has multiple values for one key!:
	@vs_hash = Hash.new { |hash, key| hash[key] = [] }
	@vs = @basketballdb.execute("select opponents.opp_team, players.name from players join stats on players.id=stats.player_id join opponents on opponents.id=stats.opponent_id;")
	@vs.each { |hash| @vs_hash[hash[1]] << hash[0]}
	@vs_hash
end
	vs_opp

# create method to view full player - team list
def players_list
	@pplayers = @basketballdb.execute("select Name, Team from players")
end 
	players_list



# create method to make an array for an ".include?" for the if player input is in the datebase
def all_players
	@all_players = []
	players = @basketballdb.execute("select name from players")
	players.each { |hash| @all_players << hash["Name"]}
end
	all_players


# create method for viewing stats of any player in database, with a loop:
def view_stats
puts "To view the stats, please type in player's name or type 'Exit' to exit program"
puts "Here is the player list:" 
@pplayers.each { |hash| puts "*#{hash[0]} - #{hash[1]}" }
player_stat = gets.chomp.split.map(&:capitalize).join(' ')
player_id = @id_hash[player_stat]

	while @all_players.include?(player_stat) != false


		if @all_players.include?(player_stat) == true
			puts "\nSelect the opponent you would like to see #{player_stat}'s stats against:"
			teams = @vs_hash[player_stat]
			teams.each { |team| puts "*#{team}" }
			opp = gets.chomp.split.map(&:capitalize).join(' ')
			opp_id = @opp_hash[opp]
			# call execute on the database in order to show stats to be more user readable:
			stats = @basketballdb.execute("SELECT stats.points, stats.rebounds, stats.assists, opponents.opp_team FROM players JOIN stats ON players.id=stats.player_id JOIN opponents ON opponents.id=stats.opponent_id WHERE players.id = #{player_id} and opponent_id = #{opp_id}")
			stats.each { |hash| puts "#{player_stat}'s stats against the #{hash[3]}:\nPoints: #{hash[0]}\nRebounds: #{hash[1]}\nAssists: #{hash[2]}" }

			puts "\nWould you like to view another? 'Y' or 'N'."
			input = ""
			input = gets.chomp.capitalize
				if input == "Y"
				puts "Here is the player list:" 
				@pplayers.each { |hash| puts "*#{hash[0]} - #{hash[1]}" }
				puts "\nPlease select another player:"
				player_stat = gets.chomp.split.map(&:capitalize).join(' ')
			    player_id = @id_hash[player_stat]

				elsif input == "N"
				puts "Thank you for using Statistics Tracker!"
				break

				end
		elsif input == "N"
			puts "\n Thank you for using Statistics Tracker!"
			break
		else
			puts "Error: request denied"
			puts "Please select another player."
		end
	end
end
#call method:
view_stats




