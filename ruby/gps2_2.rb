# Method to create a list
# input: string of items separated by spaces (example: "carrots apples cereal pizza")
# steps: 
  # Initialize/Def a new METHOD that creates a new list that takes a string of items
  # Create/initialize a new HASH (that will eventually hold list with quantity)
  # Assign string of items into an ARRAY
  # Set default quantity of (1) to each of ARRAY's item while assigning it to the HASH
  # print the list to the console [can you use one of your other methods here?]
# output: hash 

# Method to add an item to a list
# input: hash key and value pair
# steps: Add a key value pair to the hash
# output: Hash with addition of key value pair

# Method to remove an item from the list
# input: key that requires removal
# steps: Remove selected key from hash
# output: Updated hash missing the key-value pair that was removed

# Method to update the quantity of an item
# input: Key for which value needs to be updated, as well as new value
# steps: Update appropriate key with new value
# output: Hash with same keys and a new value for one

# Method to print a list and make it look pretty
# input:  Hash
# steps: keys and values translated into readable sentence
# output: Printed out sentences of items and quantities


def new_list(string)
  list_hash = {}
  list_array = string.split(" ")
  list_array.each {|item| list_hash[item] = 1}
  p list_hash
end

def add_item(input_list, input_item, input_quantity)
    input_list[input_item] = input_quantity
  p input_list
end

def remove_item(input_list, input_item)
  resulting_input_list = input_list.delete(input_item)
  puts resulting_input_list
end

def update_quantity(input_list, input_item, input_quantity)
    input_list[input_item] = input_quantity
  p input_list  
end

def print_list(list)
  list.each {|item, quantity| puts "You have #{quantity} #{item}!"}
end

#### DRIVER CODE
example_string = "carrots apples cereal pizza"
example_list = new_list(example_string)
# add_item(example_list, "bananas", 7)



second_string = "blue, red, green"
second_example_list = new_list(second_string)
add_item(second_example_list, "brown", 2)
remove_item(second_example_list, "green")
print_list(example_list)
update_quantity(example_list, "apples", 2)

third_string = "lemonade tomatoes onions ice_cream"
third_example_list = new_list(third_string)
update_quantity(third_example_list, "lemonade", 2)
update_quantity(third_example_list, "tomatoes", 3)
update_quantity(third_example_list, "ice_cream", 4)
p remove_item(third_example_list, "lemonade")
p third_example_list
update_quantity(third_example_list, "ice_cream", 1)
print_list(example_list)

### REFLECT





