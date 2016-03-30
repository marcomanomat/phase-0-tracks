#5.2 Release 1:Explore the Docs 
#Initialize an empty array and store it in a variable (you can choose the name). 
array1 = Array.new

#Add five items to your array. Print the array.
array1.push("one", 2, "tres", "IV", 5)
p array1
#Delete the item at index 2. Print the array.
array1.delete_at(2)
p array1

#Insert a new item at index 2. Print the array.
array1.insert(2, "E")
p array1

#Remove the first item of the array without having to refer to its index. Print the array.
array1.shift
p array1

#Ask the array whether it includes a certain item. Print the result of this method call 
#(labeled so it prints as more than just an isolated boolean value without any context.)
if array1.include?("IV") == true
	p "array1 does include 'IV'" end

#Initialize another array that already has a few items in it.
array2 = ["a","b","c"]
p array2

#Add the two arrays together and store them in a new variable. Print the new array.
array3 = array1.concat array2 
p array3



#5.2 Release 2: Use Arrays in Methods 
#At the top of your file, add a method that takes three items as parameters and returns an array of those items. 
#At the bottom of the file, call the method to show that it works.
def practice(name, number, color)
	array = [name, number, color]
end
p practice("Marco", 3, "blue")

#At the top of your file, add a method that takes an array and an item as parameters, and returns the array with the item added. 
#Print a few test calls of the method.
def practice2(arr, name)
	arr << name
	
end
p practice2(["a","b","c"], "Marco")
p practice2([], "Marco")