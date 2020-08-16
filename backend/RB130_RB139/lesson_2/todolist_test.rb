require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative 'todolist_additional_methods'

class TodoListTest < MiniTest::Test

  def setup
    @todo1 = Todo.new("Buy milk")
    @todo2 = Todo.new("Clean room")
    @todo3 = Todo.new("Go to gym")
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end

  def test_to_a
    assert_equal(@todos, @list.to_a)
  end

  def test_size
    array_size = @todos.size
    assert_equal(array_size, @list.size)
  end

  def test_first
    assert_equal(@todo1, @list.first)
  end

  def test_last
    assert_equal(@todo3, @list.last)
  end

  def test_shift
    assert_equal(@todo1, @list.shift)
  end

  def test_pop
    assert_equal(@todo3, @list.pop)
  end

  def test_done?
    assert_equal(false, @list.done?)
  end

  def test_type_error
    assert_raises(TypeError) { @list << Array.new }
  end
  
  def test_add
    test_todo = Todo.new("Testing")
    @list.add(test_todo)
    @todos << test_todo

    assert_equal(@todos, @list.todos)
  end

  def test_item_at
    assert_equal(@todo1, @list.item_at(0))
    assert_raises(IndexError) { @list.item_at(5) }
  end

  def test_mark_done_at
    @todo1.done!
    @list.mark_done_at(0)
    assert_raises(IndexError) { @list.mark_done_at(5) }
    assert_equal(@todo1, @list.item_at(0))
  end

  def test_mark_undone_at
    @todo1.undone!
    @list.mark_undone_at(0)

    assert_equal(@todo1, @list.item_at(0))
  end

  def test_done!
    @todos.each { |todo| todo.done! }
    @list.done!

    assert_equal(@todos, @list.todos)
  end

  def test_remove_at
    @todos.pop
    @list.remove_at(2)

    assert_equal(@todos, @list.todos)
    assert_raises(IndexError) { @list.remove_at(5) }
  end

  def test_to_s
    skip
    output = <<-OUTPUT.chomp.gsub /^\s+/, ""
    ---- Today's Todos ----
    [ ] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT

    assert_equal(output, @list.to_s)
  end 

  def test_each_1
    @list.each { |todo| todo.done! }
    assert_equal(true, @list.done?)
  end

  def test_each_2
    return_obj = @list.each { |todo| puts todo }
    assert_equal(return_obj, @list)
  end
end
