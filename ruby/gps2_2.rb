# Method to create a list
# input: string of items separated by spaces (example: "carrots apples cereal pizza")
# steps: 
  # Create a new hash
  # Write a method to assign words in string to hash keys
  # Assign values to each key
  # set default quantity
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


def create_list(str)
  groc_list = {}
  str_array = str.split(' ')
  str_array.each do |item| 
    groc_list[item] = 1
  end
  p groc_list
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
example_list = "carrots apples cereal pizza"
example = create_list(example_list)
# add_item(example_list, "bananas", 7)



another_list = "blue, red, green"
another_example = create_list(another_list)
add_item(another_example, "brown", 2)
remove_item(another_example, "green")
print_list(example)
update_quantity(example, "apples", 2)

last_list = "lemonade tomatoes onions ice_cream"
last_example = create_list(last_list)
update_quantity(last_example, "lemonade", 2)
update_quantity(last_example, "tomatoes", 3)
update_quantity(last_example, "ice_cream", 4)
p remove_item(last_example, "lemonade")
p last_example
update_quantity(last_example, "ice_cream", 1)
print_list(example)
