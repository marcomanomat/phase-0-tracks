#5.3 Symbols and Hashes

#create new (empty) hash.
designer = {}
#prompt the user for all information needed.
#set each input as a the value to a newly created key in the new hash.
puts "Please input client's name:"
designer[:name] = gets.chomp.capitalize

puts "Please input client's age:"
designer[:age] = gets.chomp.to_i

puts "Please input number of client's children:"
designer[:number_of_children] = gets.chomp.to_i

puts "Please input client's decor theme:"
designer[:decor_theme] = gets.chomp

#print the hash back out to the screen when finished.
p designer
#ask if any input is inaccurate, if it is ask which and prompt to re-enter, if none, end the loop
puts "Is all the information accurate? If so, please enter the category. If everything is correct, please enter 'none'."
ask_again = gets.chomp

if ask_again == "name"
	puts "Please re-enter name:"
	designer[:name] = gets.chomp.capitalize
elsif ask_again == "age"
	puts "Please re-enter age:"
	designer[:age] = gets.chomp.to_i
elsif ask_again == "children"
	puts "Please re-enter number of children:"
	designer[:children] = gets.chomp.to_i
elsif ask_again == "decor"
	puts "Please re-enter decor theme:"
	designer[:decor_theme] = gets.chomp
elsif ask_again == "none"
end

p designer
