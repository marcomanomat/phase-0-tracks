puts "What is your hamster's name?"
	name = gets.chomp.capitalize

puts "On a scale from 1-10, how loud is #{name}?"
	volume = gets.chomp.to_i

puts "What is #{name}'s fur color?"
	color = gets.chomp

puts "Is #{name} a good candidate for adoption?"
	adoption = gets.chomp

puts "How old is #{name}? (in years)"
	age = gets.chomp
	if age == ""
	age = nil
	end

puts "The hamster's name is #{name}. On a scale from 1-10, #{name}'s volume is #{volume}."
puts "#{name}'s fur color is #{color}. Is #{name} a good candidate for adoption?: #{adoption}. #{name} is #{age} years old."
