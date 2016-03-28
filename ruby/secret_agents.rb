

def decrypt(password)
  index= 0
  alpha = "abcdefghijklmnopqrstuvwxyz"
  while index < password.length
    index_letter = password[index].downcase
    if index_letter == "!"
      print " "
    else
    alpha_index_number = alpha.index(index_letter)
    index_minus_1 = alpha_index_number - 1
      if index == 0
        print alpha[index_minus_1].capitalize
      else
       print alpha[index_minus_1]
      end
    end
    index +=1
  end
end



def encrypt(password)
 index= 0
 while index < password.length
   password[index] = password[index].next
   index +=1
 end
   if password.include? "ab"
       return password.gsub!("ab", "a")
   else
       return password
   end
end



#decrypt(encrypt("The duck flies at midnight"))

puts "Would you like to Encrypt or Decrypt a password?"
enc_or_decrypt = gets.chomp.downcase
puts "What word would you like to #{enc_or_decrypt}?"
word = gets.chomp
if enc_or_decrypt == "encrypt"
  puts encrypt(word)
elsif enc_or_decrypt == "decrypt"
  puts decrypt(word)

end
