
class TodoList
  def initialize(original_chores)
    @original_chores = original_chores
  end
   
  def get_items
   p @original_chores
  end

  def add_item(item)
  p @original_chores << item
  end

  def delete_item(item)
   p @original_chores.delete(item)
  end

  def get_item(index)
    p @original_chores[index]
  end


  
end