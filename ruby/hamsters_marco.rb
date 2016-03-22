puts "What is the hamster's name?"
name = gets.chomp.capitalize

puts "What is it's volume level, scale 1-10?"
volume = gets.chomp.to_i

puts "What is it's fur color?"
color = gets.chomp

puts "Is the hamster a good candidate for adoption?"
adoption = gets.chomp
if  adoption == "yes"
	adoption = "is"
else
	adoption ="is not"
end
	
puts "What is the hamster's approx. age?"
age = gets.chomp.to_i

print "The hamster's name is #{name}. #{name}'s volume is #{volume}, on a scale from 1-10. 
It's fur color is #{color}. #{name} #{adoption} a good candidate for adoption! It is #{age}."
