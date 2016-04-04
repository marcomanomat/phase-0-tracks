def calculate (integer1, operator, integer2)
	first_num = integer1.to_i
	second_num = integer2.to_i
	if operator == "+"
	first_num + second_num
	elsif operator == "-"
	first_num - second_num
	elsif operator == "*"
	first_num * second_num
	elsif operator == "/"
	first_num / second_num
	end
end

=begin
p calculate(3,"+",1)
p calculate(6,"-",3)
p calculate(2,"*",1)
p calculate(4,"/",4)
=end

puts "Hello, I am a calculator! Please punch in a calculation you would like me to solve!"
puts "Please see this example as a format to use: '4 + 5'."
user_calc = gets.chomp
#p user_calc
#calculate(user_calc)

integer1 = user_calc[0].to_i
integer2 = user_calc[4].to_i
operator = user_calc[2].to_s


p calculate(integer1,operator,integer2)