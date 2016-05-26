require 'pry'
require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative 'to_do_list'

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

  # Your tests go here. Remember they must start with "test_"

  def test_to_a
    assert_equal(@todos, @list.to_a)
  end

  def test_size
    assert_equal(3, @list.size)
  end

  def test_first
    assert_equal(@todo1, @list.first)
  end

  def test_last
    assert_equal(@todo3, @list.last)
  end

  def test_shift
    assert_equal(@todo1, @list.shift)
    assert_equal(@todo2, @list.shift)
    assert_equal(@todo3, @list.shift)
  end

  def test_pop
    todo = @list.pop
    assert_equal(@todo3, todo)
    assert_equal([@todo1, @todo2], @list.to_a)
  end

  def test_done?
    assert_equal(false, @todo1.done)
    assert_equal(false, @todo2.done)
    assert_equal(false, @todo3.done)
  end

  def test_TypeError
    assert_raises(TypeError) { @list << "something" }
    assert_raises(TypeError) { @list.add(1) }
  end

  def test_shovel
    new_todo = Todo.new("Walk the dog")
    @list.add(new_todo)
    todos = @todos << new_todo

    assert_equal(todos, @list.to_a)
  end
  
  def test_item_at
    # Hint: remember that this method should raise IndexError if we specify an index with no element.
    assert_equal(@todo1, @list.item_at(0))
    assert_equal(@todo2, @list.item_at(1))
    assert_raises(IndexError) { @list.item_at(10) }
  end
  
  def test_mark_done_at
    assert_raises(IndexError) { @list.mark_done_at(100) }
    @list.mark_done_at(0)
    @list.mark_done_at(1)
    assert_equal(true, @todo1.done?)
    assert_equal(true, @todo2.done?)
    assert_equal(false, @todo3.done?)
  end
  
  def test_mark_undone_at
    @list.mark_all_done
    assert_raises(IndexError) { @list.mark_undone_at(100) }
    @list.mark_undone_at(0)
    @list.mark_undone_at(1)
    assert_equal(false, @todo1.done?)
    assert_equal(false, @todo2.done?)
    assert_equal(true, @todo3.done?)
  end
  
  def test_done!
    @list.done!
    assert_equal(true, @todo1.done?)
    assert_equal(true, @todo2.done?)
    assert_equal(true, @todo3.done?)
  end
  
  def test_remove_at
    assert_raises(IndexError) { @list.remove_at(100) }
    @list.remove_at(0)
    assert_equal([@todo2, @todo3], @list.to_a)
  end
  
  # def test_to_s
  #   output = <<-OUTPUT.chomp.gsub /^\s+/, ""
  #   ---- Today's Todos ----
  #   [ ] Buy milk
  #   [ ] Clean room
  #   [ ] Go to gym
  #   OUTPUT

  # assert_equal(output, @list.to_s)
  # end
  
  # def test_to_s_2
  #   @todo1.done!
  #   output = <<-OUTPUT.chomp.gsub /^\s+/, ""
  #   ---- Today's Todos ----
  #   [X] Buy milk
  #   [ ] Clean room
  #   [ ] Go to gym
  #   OUTPUT
  #   assert_equal(output, @list.to_s)
  # end
  
  # def test_to_s_3
  # @list.mark_all_done
  # output = <<-OUTPUT.chomp.gsub /^\s+/, ""
  # ---- Today's Todos ----
  # [X] Buy milk
  # [X] Clean room
  # [X] Go to gym
  # OUTPUT

  # assert_equal(output, @list.to_s)
  # end
  
  def test_each
    done = @list.each { |todo|todo.done! }

    assert_equal(true, @todo1.done?)
    assert_equal(true, @todo2.done?)
    assert_equal(true, @todo3.done?)
  end

  def test_each_2
    done = @list.each { |todo|todo.done! }
    assert_instance_of(TodoList, done)
  end
  
  def test_select
    newlist = @list.select {|todo| nil })
    assert_equal()
  end
end