#6.4: Solo Challenge: Designing and Implementing a Class

=begin
Release 0: Design a Class

class: Basketball Player
attributes: name, ratings (shoot, pass, dribble)
methods: shoot, pass, dribble
=end

class BasketballPlayer
	attr_reader :shoot_rating, :pass_rating, :dribble_rating, :name

	def initialize(name, shoot_rating, pass_rating, dribble_rating)
		@name = name
		@shoot_rating = shoot_rating
		@pass_rating = pass_rating
		@dribble_rating = dribble_rating
	end

	def bio
		puts "#{name} is created!"
		puts "shooting rating is: #{shoot_rating}"
		puts "pass rating is: #{pass_rating}"
		puts "dribble rating is: #{dribble_rating}"
	end

	def shoot
		case shoot_rating
		when 0...50 then "#{@name} shoots: *CLANK!*"
		when 50...100 then "#{@name} shoots: *SHWOOSH!*"
		end
	end
	def pass
		case pass_rating
		when 0...50 then "#{@name} passes: *Out of bounds!*"
		when 50...100 then "#{@name} passes: *Threads the needle!*"
		end
	end
	def dribble
		case dribble_rating
		when 0...50 then "#{@name} dribbles: *Cookied!*"
		when 50...100 then "#{@name} dribbles: *Breaks opponent's ankles!*"
		end
	end
	def result
		actions = [shoot, pass, dribble]
		random = actions.sample
		p random
	end
end

### DRIVER CODE  ####
=begin
Curry = BasketballPlayer.new("Curry", 96, 91, 94)
Curry.result
Herb = BasketballPlayer.new("Herb", 3, 4, 23)
Herb.result
=end


### USER INTERFACE ###
puts "Let's create a team!"
user_input = ""
team = []

while user_input != "N"
	puts "Do you want to add a new player? (Y or N)."
		user_input = gets.chomp.capitalize

	if user_input == "Y"

		puts "What is the name of your player?"
		name = gets.chomp

		puts "What is #{name}'s shooting rating (1-100)?"
		shoot_rating = gets.to_i

		puts "What is #{name}'s passing rating (1-100)?"
		pass_rating = gets.to_i

		puts "What is #{name}'s dribbling rating (1-100)?"
		dribble_rating = gets.to_i

		created_player = BasketballPlayer.new(name, shoot_rating, pass_rating, dribble_rating)

		team << created_player

	elsif user_input == "N"
		puts ""
		puts "TEAM CONSISTS OF:"

			team.each do |player|
			puts ""
			puts "#{player.bio}"
			end
	break
		
	else
		puts "please try again: would you like to make a player? (Y or N)."
	end
end

