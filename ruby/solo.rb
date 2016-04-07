#6.4: Solo Challenge: Designing and Implementing a Class

=begin
Release 0: Design a Class

class BasketballPlayer

#3 Attributes/Characteristics
name - string
height (in inches) - integer
Best Basketball Related Quality - string

#3 Methods
shoot(how far)
dribble(to where)
pass(to who)
=end

#Release 1: Write your Class

class BasketballPlayer
	attr_reader :name
	attr_accessor :best_skill, :rating

	def initialize(name, rating, best_skill)
		@name = name
		@rating = rating
		@best_skill = best_skill
		puts "Please welcome #{@name} - he has one heluva #{@best_skill} game!"
	end

	def shoot(how_far)
		puts "#{@name} shoots from #{how_far} feet away!"
	end

	def dribble(how_long)
		puts "#{@name} dribbles for #{how_long} seconds!"
	end

	def pass(to_who)
		puts "#{@name} passes to #{to_who}!"
	end
end


#####DRIVER_CODE!

#DRIVER CODE FOR RELEASE1 
lebron = BasketballPlayer.new("LeBron James", 97, "all-around")
lebron.shoot(3)
lebron.dribble(12)
lebron.pass("Kyrie") 
#attr_reader:
puts "#{lebron.name} is s'nice!"
#attr_accessor:
lebron.best_skill = "passing"
p lebron.best_skill
lebron.rating = 98
p lebron.rating
