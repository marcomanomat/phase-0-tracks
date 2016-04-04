def last_first(name)
  lower_case = name.downcase
  lower_case = lower_case.split(" ")
  lower_case.reverse.join(" ")
end

def vowels_and_edges(letter)
	return 'e' if letter == 'a'
	return 'i' if letter == 'e'
	return 'o' if letter == 'i'
	return 'u' if letter == 'o'
	return 'a' if letter == 'u'
	return 'b' if letter == 'z'
	return 'f' if letter == 'd'
	return 'j' if letter == 'h'
	return 'p' if letter == 'n'
	return 'v' if letter == 't'
else 
	letter.next
end

def code_name(word)
	new_word = ""
	i = 0
	while i < word.length
	letter = word[i]
	if letter == ' '
		new_word += ' '
	else
		 letter == letter.downcase
		new_word += vowels_and_edges(letter)
  end
  i += 1
  end
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

    puts "Please enter another name to be changed.  Enter 'quit' if finished."
  end
end

list.each { |entered_name, capital_code_name| puts "#{entered_name} is also known by: '#{capital_code_name}'" }
