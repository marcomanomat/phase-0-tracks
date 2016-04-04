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

p calculate(3,"+",1)
p calculate(6,"-",3)
p calculate(2,"*",1)
p calculate(4,"/",4)
