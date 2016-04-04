#5.6 Solo Challenge: Manipulating Strings with Iteration

#Release 0: Attempt a Tricky Algorithm
#Pseudocode and write a method that takes a spy's real name and creates a fake name with it by:
#1. Swapping the first and last name.
#2. Changing all of the vowels (a, e, i, o, or u) to the next vowel in 'aeiou', and all of the consonants (everything else besides the vowels) to the next consonant in the alphabet. So 'a' would become 'e', 'u' would become 'a', and 'd' would become 'f'.

def last_first(name)
  down_name = name.downcase
  down_name = down_name.split(" ")
  down_name.reverse.join(" ")
end

def vowel_and_edge(letter)
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

def fake_name(word)
	new_word = ""
	i = 0
	while i < word.length
	char = word[i]
	if char == ' '
		new_word += ' '
	else
		 char == char.downcase
		new_word += vowel_and_edge(char)
  end
  i += 1
  end
  new_word
end

puts "what is your name?"
name = gets.chomp 
last_first = last_first(name)
fake_name = fake_name(last_first)
capital_fake_name = fake_name.split.map(&:capitalize).join(" ")
p "your fake name is #{capital_fake_name}!"







