puts "What is your hamster's name?"
name = gets.chomp.capitalize

puts "On a scale from 1-10, how loud is your hamster?"
volume = gets.chomp.to_i

puts "What is your hamster's fur color?"
color = gets.chomp

puts "Is your hamster a good candidate for adoption?"
adoption = gets.chomp

puts "How old is your hamster? (in years)"
age = gets.chomp
if age == ""
	age = nil
end

print "The hamster's name is #{name}. On a scale from 1-10, it's volume is #{volume}. It's fur color is #{color}. Is this hamster a good candidate for adoption: #{adoption}. The hamster is #{age} years old."