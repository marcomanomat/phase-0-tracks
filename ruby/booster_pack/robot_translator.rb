# ROBOT TRANSLATOR

# If a letter is capitalized and it's in the first half of the alphabet, it becomes: "bloop".
# A - M (1st half); N - Z (2nd half)

# Otherwise, if a letter is capitalized or it's the letter "e", it becomes: "buzz".

# If it's not a letter at all, it becomes: "boing".

# Otherwise, it becomes: "beep".

# "Happy Halloween!" => "bloopbeepbeepbeepbeepboingbloopbeepbeepbeepbeepbeepbuzzbuzzbeepboing"

alpha = "abcdefghijklmnopqrstuvwxyz"
half_1 = alpha[0..12]
half_2 = alpha[13..26]

word = "Happy Halloween!"
separated_letter_array = word.split("")

new_array = []
separated_letter_array.each do |letter|
	if 
		half_1.include?(letter.downcase) && letter == letter.capitalize
		new_array << "bloop"
	elsif
		unless alpha.include?(letter)
		new_array << "boing"
		end
	elsif
		letter == letter.capitalize || letter == "e"
		new_array << "buzz"
	else
		new_array << "beep"
	end
end

robot = new_array.join('')

p robot