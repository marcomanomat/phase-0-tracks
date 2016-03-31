#5.4 Mandatory Pairing: Iteration

#Release 0
#Write your own method that takes a block. 
#Your method should print out a status message before and after running the block. 
#Your block doesn't have to do anything fancy -- it can just print out several of its own parameters.
def hello
	puts "Hello, how are you?"
	yield("man", "dude")
end

hello {|person1, person2| puts "I am doing fine, #{person1}! Thank you, #{person2}."}


#Release 1: Use `each`, `map`, `map!`

#set array and hash
top_individuals = ["lebron", "curry", "durant"]
top_team_pitchers = {"Mets" => "deGrom", "Cubs" => "Arrieta", "Dodgers" => "Kershaw" }

p top_individuals

#using .map! to modify/iterate an array:
top_individuals.map! do |player|
	puts player
	player.capitalize
end
p top_individuals

#using .each to iterate an array:
top_individuals.each do |player|
	puts "#{player} is one of the top individual players in the NBA."
end
p top_individuals


#using .each to iterate a hash:
top_team_pitchers.each do |team, pitcher|
	puts "The #{team}'s best pitcher is #{pitcher}!"
end
p top_team_pitchers

#Release 2: Use Documentation

array = [2,5,11,20,99]
hash = {"a"=>100, "b"=>200, "c"=>300, "d"=>400}

#A method that iterates through the items, deleting any that meet a certain condition 
#(for example, deleting any numbers that are less than 5).
array = [2,5,11,20,99]
p array.delete_if { |number| number < 5 }

hash = {"a"=>100, "b"=>200, "c"=>300, "d"=>400}
p hash.delete_if { |letter, number| letter < "c" }

#A method that filters a data structure for only items that do satisfy a certain condition 
#(for example, keeping any numbers that are less than 5).
array = [2,5,11,20,99]
p array.keep_if {|number| number > 10}

hash = {"a"=>100, "b"=>200, "c"=>300, "d"=>400}
p hash.keep_if { |letter, number| letter > "a"}

#A different method that filters a data structure for only items satisfying a certain condition 
#- Ruby offers several options!
array = [2,5,11,20,99]
p array.select {|number| number.even?}

hash = {"a"=>100, "b"=>200, "c"=>300, "d"=>400}
p hash.select { |letter, number| letter == "c"}
 

#A method that will remove items from a data structure until the condition in the block..
#..evaluates to true, then stops.
array = [2,5,11,20,99]
p array.reject {|number|number >= 11}

hash = {"a"=>100, "b"=>200, "c"=>300, "d"=>400}
p hash.reject {|letter, number| letter == "x" || number >= 400}




