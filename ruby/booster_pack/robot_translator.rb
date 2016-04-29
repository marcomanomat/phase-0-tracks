# ROBOT TRANSLATOR

# If a letter is capitalized and it's in the first half of the alphabet, it becomes: "bloop".
# A - M (1st half); N - Z (2nd half)
# Hint, watch for capitals! - have to use .downcase/.capitalize when needed

# Otherwise, if a letter is capitalized or it's the letter "e", it becomes: "buzz".

# If it's not a letter at all, it becomes: "boing".

# Otherwise, it becomes: "bleep".

# "Happy Halloween!" => "bloopbeepbeepbeepbeepboingbloopbeepbeepbeepbeepbeepbuzzbuzzbeepboing"

alpha = "abcdefghijklmnopqrstuvwxyz"
half_1 = alpha[0..12].split("")
half_2 = alpha[13..26]
half_1

word = "Happy Halloween!"
separated_letter_array = word.split("")

new_array = []
separated_letter_array.each do |letter|
	if half_1.include?(letter.downcase) && letter == letter.capitalize
		new_array << "bloop"
	 else
		 new_array << letter
	end
end

p new_array