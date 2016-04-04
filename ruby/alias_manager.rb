def last_first(name)
  lower_case = name.downcase
  lower_case = lower_case.split(" ")
  lower_case.reverse.join(" ")
end

def vowels_and_edges(letter)
#vowels
	return 'e' if letter == 'a'
	return 'i' if letter == 'e'
	return 'o' if letter == 'i'
	return 'u' if letter == 'o'
	return 'a' if letter == 'u'
#edge cases
	return 'b' if letter == 'z'
	return 'f' if letter == 'd'
	return 'j' if letter == 'h'
	return 'p' if letter == 'n'
	return 'v' if letter == 't'
#next letter	
	else 
	letter.next
end

#create looping method to loop through the string and find new characters to replace the old:
def code_name(word)
#set a new word to an empty string, we are going to fill it using the rest of the loop:
	new_word = ""
#start index at 0
	i = 0
#loop through the string:
	while i < word.length
#letter is going to be the index of the word put in, starting at the 0 position until the end of the word's length
	letter = word[i]
#if a space is found, add a space to the new word
		if letter == ' '
		new_word += ' '
#everything else, find the next letter or the next vowel or next edge case, and add it to the new word
		else
		 letter == letter.downcase
		new_word += vowels_and_edges(letter)
  		end
  		i += 1
    end
#should result in a new word, when all strings are pieced together   
  new_word
end


puts "Please enter the name you would like to change (first and last name)."

puts "Type 'quit' when you are completed."

finished = false 
list = {}

until finished == true
  entered_name = gets.chomp
  if entered_name == "quit"
    puts "Come back when you have more names!"
    finished = true 
  else
	last_first = last_first(entered_name)
	code_name = code_name(last_first)
	capital_code_name = code_name.split.map(&:capitalize).join(" ")
	p "Your code name is now: #{capital_code_name}"

    list[entered_name] = capital_code_name 

    puts "Please enter new name or type 'quit' if you are completed."
  end
end

list.each { |entered_name, capital_code_name| puts "#{entered_name} is also known by: '#{capital_code_name}'" }
