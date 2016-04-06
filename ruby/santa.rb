#6.3 Attributes

class Santa

	attr_accessor :gender, :ethnicity, :age 
	attr_reader :reindeer_ranking

	def initialize(gender, ethnicity)
	puts "Initializing Santa instance..."
	@gender = gender
	@ethnicity = ethnicity
	@reindeer_ranking = ["Rudolph", "Dasher", "Dancer", "Prancer", "Vixen", "Comet", "Cupid", "Donner", "Blitzen"]
	@age = 0
	end

	def speak
	puts "Ho, ho, ho! Haaaappy holidays!"
	end

	def eat_milk_and_cookies(cookie_type)
	puts "That was a good #{cookie_type} cookie!"
	end

	def celebrate_birthday
			@age += 1
	end

	def get_mad_at(reindeer)
		downgraded_reindeer = @reindeer_ranking.delete(reindeer)
		@reindeer_ranking.push(downgraded_reindeer)
	end

	def gender
		@gender
	end

	def ethnicity
		@ethnicity
	end

end


santa1 = Santa.new("male", "American")
puts "this Santa's gender is #{santa1.gender} and he is #{santa1.ethnicity}!"
p santa1.celebrate_birthday



=begin
santas = []
example_genders = ["agender", "female", "bigender", "male", "female", "gender fluid", "N/A"]
example_ethnicities = ["black", "Latino", "white", "Japanese-African", "prefer not to say", "Mystical Creature (unicorn)", "N/A"]
example_genders.length.times do |i|
  santas << Santa.new(example_genders[i], example_ethnicities[i])
end
=end
