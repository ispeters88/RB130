# Simple Linked List
# Write a simple linked list implementation. The linked list is a fundamental data structure in computer science, often used in the implementation of other data structures.
# 
# The simplest kind of linked list is a singly linked list. Each element in the list contains data and a "next" field pointing to the next element in the list of elements. This variant of linked lists is often used to represent sequences or push-down stacks (also called a LIFO stack; Last In, First Out).
# 
# Let's create a singly linked list whose elements may contain a range of data such as the numbers 1-10. Provide methods to reverse the linked list and convert a linked list to and from an array.


## Problem ##

# Classes needed:
#   1) SimpleLinkedList
#   2) Element
#
# Methods needed
# SimpleLinkedList
#   1) constructor - no arguments
#   2) `#list` instance method --- This might not actually be needed??
#   3) `#size` instance method
#   4) `#push` instance method - 1 argument
#   5) `#pop` instance method - no arguments
#   6) `#peek` instance method - no arguments
#   7) `#head` instance method - no arguments
#   8) `#to_a` instance method - no arguments
#   9) `#reverse` instance method - no arguments
#   10) `#from_a` class method - 1 argument
#   11) `#empty?` instance method - no arguments
#
# Element
#   1) constructor - 2 arguments, one required, one optional. The first (required) argument will be a value (seems like numeric values in the examples provided), while the second will be a separate object instance of the Element class
#   2) `#datum` instance method - returns the value passed in for the first argument when the object was created
#   3) `#tail?` instance method - **not yet clear on what this does**
#   4) `#next` instance method


class Element
  attr_reader :datum, :next
  def initialize(datum, adj=nil)
    @datum = datum
    @next = adj
  end

  def tail?
    !self.next
  end
end

class SimpleLinkedList
  def initialize
    @elements = []
  end

  def size
    @elements.size
  end

  def push(datum)
    @elements << Element.new(datum, @elements.last)
  end

  def pop
    @elements.pop.datum
  end

  def peek
    last_ele = @elements.last
    last_ele ? last_ele.datum : nil
  end

  def head
    # the head value may or may not have a `@next` value. 
    # BUT no other values in the linked list should have it as their `@next` value!
    (@elements - @elements.map(&:next)).first
  end

  def reverse
    SimpleLinkedList.from_a(all_datums)
    # @elements.reverse.each { |ele| list_r.push(ele) }
    # list_r
  end

  def to_a
    all_datums.reverse
  end

  def self.from_a(arr)
    if arr.nil?
      SimpleLinkedList.new
    else
      list = SimpleLinkedList.new
      arr.reverse.each { |ele| list.push(ele) }
      list
    end
  end

  def empty?
    @elements.empty?
  end

  private

  def all_datums
    @elements.map(&:datum)
  end
end


## Algorithm ##

# `Element`
#   constructor method - assign the first argument to instance variable `@datum`. Assign the 2nd argument to instance variable `@next`. Default for this second argument should be `nil`
#   `next` method - can shortcut this with an `attr_reader` on `@next`
#   `datum` - same as above but with `@datum`

# `SimpleLinkedList`
#   constructor method - create an empty array object and assign to instance variable `@elements`
#   `#push` - create a new `Elements` object with the passed in value as argument 1, and last item in `@elements` as argument 2
#   `#pop` - remove the last item in `@elements` and return its `@datum` value
#   `# size` - return the size of `@elements`
#   `# empty?` - call `Array#empty?` on `@elements`
#   `# head` - I *think* this will be the first item in `@elements`, based on the examples provided. Should be the `Element` object itself, *not* its `datum` value
#   `#peek` - this seems like it should be returning the `@datum` value of the last element in `@elements`
#       * After further review, it is not this simple. It seems to be the one element in the linked list that does not link to a nother element as the other element's `@next` value
#       * To find this, could we just find the difference between `@elements` and an array containing the `@next` values for all the elements in `@elements`? We could get the latter with an easy `map` call....
#   `#from_a` - based on the examples provided, this seems to be pulling the array values in reverse order. Not sure why we would do it that way...
#       * We definitely should be calling the constructor to create a new instance of `SimpleLinkedList`
#       * Need to handle a `nil` argument
#       * If argument is not nil, after creating the new `SimpleLinkedList` object, run `each` over the reversed array argument, and push each element to `@elements`
#   `#to_a` - return an array containing the `@datum` values from each element in `@elements`. Looks like we need to reverse the elements, as well?
#   `#reverse` - this needs to return a `SimpleLinkedList` object