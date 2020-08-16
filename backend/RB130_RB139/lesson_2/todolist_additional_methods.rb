# Add to make the attr_reader :todos public for the TodoList class 
# for the purposes of completing the testing assignment

class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description='')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end

  def ==(otherTodo)
    title == otherTodo.title &&
      description == otherTodo.description &&
      done == otherTodo.done
  end
end

class TodoList
  attr_accessor :title

  attr_reader :todos

  def initialize(title)
    @title = title
    @todos = []
  end

  def <<(obj)
    raise TypeError, 'can only add Todo objects' unless obj.instance_of?(Todo)
    
    todos << obj
  end

  alias_method :add, :<<

  def size
    todos.size
  end

  def first
    todos.first
  end

  def last
    todos.last
  end

  def to_a
    arr = []
    todos.each { |el| arr << el }
    arr
  end

  def done?
    todos.all? { |el| el.done? }
  end

  def item_at(idx)
    todos.fetch(idx)
  end
  
  def mark_done_at(idx)
    item_at(idx).done!
  end

  def mark_undone_at(idx)
    item_at(idx).undone!
  end

  def done!
    todos.each { |el| el.done! }
  end

  def shift
    todos.shift
  end

  def pop
    todos.pop
  end

  def remove_at(idx)
    todos.delete(item_at(idx))
  end

  def to_s
    puts "--- Today's Todos ---"
    todos.each { |el| puts el }
    puts "---------------------"
  end

  def each
    counter = 0

    while counter < todos.size
      yield(todos[counter])
      counter += 1
    end

    self
  end

  def select
    selected_array = TodoList.new(title)

    todos.each do |el|
      selected_array << el if yield(el)
    end
    selected_array
  end

  def find_by_title(str)
    match = nil

    todos.each do |el|
      match = el unless el.title.scan(str).empty?
    end
    match
  end

  def all_done
    todos.select { |el| el.done? }
  end

  def all_not_done
    todos.select { |el| !el.done? }
  end

  def mark_done(str)
    find_by_title(str).done! unless find_by_title(str).nil?
  end

  def mark_all_done
    todos.each { |el| el.done! }
  end

  def mark_all_undone
    todos.each { |el| el.undone! }
  end
end


todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")
list = TodoList.new("Today's Todos")

list.add(todo1)                 # adds todo1 to end of list, returns list
list.add(todo2)                 # adds todo2 to end of list, returns list
list.add(todo3)                 # adds todo3 to end of list, returns list

# puts list.find_by_title("Not present")
# puts list.find_by_title("Buy milk")
# 
# puts list.all_done
# todo2.done!
# puts list.all_done
# puts list.all_not_done

# puts list.mark_done("Go to gym")
# puts list
# puts list.mark_done("Not present")

list.mark_all_done
puts list
list.mark_all_undone
puts list
