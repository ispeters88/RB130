require "simplecov"
SimpleCov.start

require 'minitest/autorun'
require 'minitest/reporters'

Minitest::Reporters.use!

require_relative 'todolist'

class TodoTest < Minitest::Test
  def setup
    @todo1 = Todo.new("Buy milk")
    @todo2 = Todo.new("Clean room")
    @todo3 = Todo.new("Go to gym")
  end

  def test_undone!
    @todo1.done!
    @todo1.undone!

    assert_equal(false, @todo1.done?)
  end

  def test_equals
    todo1_copy = Todo.new("Buy milk")

    assert_equal(@todo1, todo1_copy)
  end

  def to_s
    output_undone = <<~OUTPUT.chomp
    [ ] Buy milk
    OUTPUT
    
    output_done = <<~OUTPUT.chomp
    [X] Buy milk
    OUTPUT

    assert_equal(output_undone, @todo1.to_s)
    @todo1.done!
    assert_equal(output_done, @todo1.to_s)
  end
end

class TodoListTest < Minitest::Test
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
    assert_equal(3, @list.size)
  end

  def test_first
    assert_equal(@todo1, @list.first)
  end

  def test_last
    assert_equal(@todo3, @list.last)
  end

  def test_shift
    todo = @list.shift
    assert_equal(@todo1, todo)
    assert_equal([@todo2, @todo3], @list.to_a)
  end

  def test_pop
    todo = @list.pop
    assert_equal(@todo3, todo)
    assert_equal([@todo1, @todo2], @list.to_a)
  end

  def test_done?
    @list.done!

    assert_equal(true, @list.done?)
  end

  def test_all_done
    @todo2.done!

    assert_equal([@todo2], @list.all_done.to_a)

    @todo3.done!

    assert_equal([@todo2, @todo3], @list.all_done.to_a)
  end

  def test_all_not_done
    @todo2.done!

    assert_equal([@todo1, @todo3], @list.all_not_done.to_a)

    @todo3.done!

    assert_equal([@todo1], @list.all_not_done.to_a)
  end

  def test_add_non_todo_error
    assert_raises(TypeError) { @list.add(1) }
    assert_raises(TypeError) { @list.add(String.new) }
    assert_raises(TypeError) { @list.add(Array.new) }
    assert_raises(TypeError) { @list.add(Hash.new) }
  end

  def test_shovel
    new_todo = Todo.new("Mow the lawn")
    @list << new_todo
    @todos << new_todo

    assert_equal(@todos, @list.to_a)
  end

  def test_add
    new_todo = Todo.new("Go to the bank")
    @list.add(new_todo)
    @todos << new_todo

    assert_equal(@todos, @list.to_a)
  end

  def test_item_at
    assert_raises(IndexError) { @list.item_at(100) }
    assert_equal(@todo1, @list.item_at(0))
    assert_equal(@todo2, @list.item_at(1))
  end

  def test_find_by_title
    title = "Clean room"

    assert_equal(@todo2, @list.find_by_title(title))
    assert_equal(nil, @list.find_by_title("Not a title"))
  end

  def test_mark_done_at
    assert_raises(IndexError) { @list.item_at(100) }
    @list.mark_done_at(0)
    @list.mark_done_at(1)
    assert_equal(true, @list.item_at(0).done? )
    assert_equal(true, @list.item_at(1).done? )
    assert_equal(false, @list.item_at(2).done? )
  end

  def test_mark_done
    title = "Clean room"

    assert_nil(@list.find_by_title("Not a title"))

    @list.mark_done(title)
    assert_equal(true, @todo2.done?)
  end

  def test_mark_undone_at
    assert_raises(IndexError) { @list.item_at(100) }
    @todo1.done!
    @todo2.done!
    @todo3.done!

    @list.mark_undone_at(1)

    assert_equal(true, @todo1.done?)
    assert_equal(false, @todo2.done?)
    assert_equal(true, @todo3.done?)
  end

  def test_mark_all_done
    @list.mark_all_done

    assert_equal(true, @list.done?)
  end

  def test_mark_all_undone
    @list.mark_all_undone

    assert_equal(0, @list.all_done.size)
  end

  def test_done_bang
    @list.done!

    assert_equal(true, @todo1.done?)
    assert_equal(true, @todo2.done?)
    assert_equal(true, @todo3.done?)
  end

  def test_remove_at
    assert_raises(IndexError) { @list.remove_at(100) }
    @list.remove_at(1)

    assert_equal([@todo1, @todo3], @list.to_a)
  end

  def test_to_s
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [ ] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT

    assert_equal(output, @list.to_s)
  end

  def test_to_s_one_done
    @list.mark_done_at(1)

    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [ ] Buy milk
    [X] Clean room
    [ ] Go to gym
    OUTPUT

    assert_equal(output, @list.to_s)
  end
  
  def test_to_s_all_done
    @list.done!

    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [X] Buy milk
    [X] Clean room
    [X] Go to gym
    OUTPUT

    assert_equal(output, @list.to_s)
  end

  def test_each
    all_todos = []

    @list.each { |todo| all_todos << todo }

    assert_equal([@todo1, @todo2, @todo3], all_todos)
  end

  def test_each_return
    each_return = @list.each { |todo| "Doesn't matter" }
    assert_equal(each_return, @list)
  end

  def test_select
    @todo1.done!
    list = TodoList.new(@list.title)
    list.add(@todo1)
  
    assert_equal(list.title, @list.title)
    assert_equal(list.to_s, @list.select{ |todo| todo.done? }.to_s)
  end
end
