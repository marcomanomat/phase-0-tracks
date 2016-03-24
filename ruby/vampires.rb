
puts "How many employees will be processed?"
employees = gets.chomp.to_i

i=1
while i <= employees
	i += 1


puts "What is your name?"
name = gets.chomp.split(" ").map(&:capitalize).join(" ")

puts "How old are you?"
age = gets.chomp.to_i

puts "What year were you born?"
year = gets.chomp.to_i

puts "Our company cafeteria serves garlic bread. Should we order some for you?"
garlic = gets.chomp

puts "Would you like to enroll in the company's health insurance?"
health = gets.chomp



puts "List all your allergies, one at a time (type 'done' when complete)"
while allergies = gets.chomp
case allergies
when "sunshine"
	puts "Probably a vampire." unless name == "Drake Cula" || "Tu Fang"
	break
when "done"
	break
	end
end


#Even if the employee is an amazing liar otherwise, anyone going by the name of “Drake Cula” or “Tu Fang” is clearly a vampire, because come on. 
if name == "Drake Cula" 
	puts "Definitely a vampire."
#if I add "Tu Fang" to original if statement with ||, it does not work for some reason	
elsif name == "Tu Fang"
	puts "Definitely a vampire."

#if the employee got their age right, and is willing to eat garlic bread or sign up for insurance
elsif age == 2016 - year && (garlic == "yes" || health == "yes")
	puts "Probably not a vampire."


#If the employee got their age wrong, and hates garlic bread or waives insurance
elsif age !=  2016 - year && (garlic == "no" && health == "yes") ||(garlic == "yes" && health == "no") 
	puts "Probably a vampire."

#If the employee got their age wrong, hates garlic bread, and doesn’t want insurance
elsif age != 2016 - year && garlic == "no" && health == "no"
	puts "Almost certainly a vampire."
	
else
    puts "Results inconclusive."
end
puts "Actually, never mind! What do these questions have to do with anything? Let's all be friends.ß"
end


