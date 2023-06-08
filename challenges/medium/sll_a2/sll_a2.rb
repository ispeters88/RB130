# frozen_string_literal: true

# Simple Linked List
# Write a simple linked list implementation. The linked list is a fundamental data structure in computer science, often used in the implementation of other data structures.
#
# The simplest kind of linked list is a singly linked list. Each element in the list contains data and a "next" field pointing to the next element in the list of elements. This variant of linked lists is often used to represent sequences or push-down stacks (also called a LIFO stack; Last In, First Out).
#
# Let's create a singly linked list whose elements may contain a range of data such as the numbers 1-10. Provide methods to reverse the linked list and convert a linked list to and from an array.

## Classes ##
# Element
# SimpleLinkedList

## Methods ##
#
# Element
#   1) constructor - 1 required argument, 1 optional argument - set the ivar `datum` to the value of the first argument. Set the ivar `next` to the value of the 2nd if it is provided, else set to `nil`
#   2) datum (looks like ivar getter)
#   3) tail? - return `true` if the receiver is a `tail`
#       ** what does this mean?
#   4) next - ivar getter

# SimpleLinkedList
#   1) constructor - no arguments. So we don't need one?
#   2) size - iterate as described below
#   3) empty? - just check is `#size` is 0
#   4) push - 1 argument
#     > create a new `Element` object with the passed in argument as its `datum`, and the current `head` value as its `next`. Then update the current `head` value to this new `Element` object
#   5) peek
#     > this just returns the datum value of the `head` of the list
#   6) head
#     > we could potentially add this as an ivar and set it each time we push data onto the list
#   7) pop
#   8) reverse
#     > create a new SimpleLinkedList object and save it off
#     > iterate over the items in the receiving SLL object until getting to the tail. Push
#   9) to_a

# class methods
#   1) from_a
#     > iterate over the array, and push each item onto the list
#     > the return of this method should be a new SimpleLinkedList object

# Goal is to do this without using an array or other similar collaborator object. Doing so would make things like `size` and `reverse` much easier. Without this convenience, how do we keep track of the full set of items? We have to iterate through them using their respective `next` values. We should always start with the head of the list, which would be the

# size iteration

# With the `head` attribute defined appropriately, now the other methods will rely on iteration through the `next` values of each element.
#     How best to iterate?
# Perhaps with logic where we increase a counter as long as the `next` value of the current receiving object is not `nil`? - reason being, when we are traversing the singly linked list, we need to stop as soon as we reach an element with no `next` value

class Element
  attr_accessor :datum, :next

  def initialize(datum, next_el = nil)
    @datum = datum
    @next = next_el
  end

  def tail?
    !self.next
  end
end

class SimpleLinkedList
  attr_accessor :head

  def push(val)
    if !!head
      self.head = Element.new(val, head)
    else
      self.head = Element.new(val)
    end
  end

  def pop
    old_head = head.dup
    self.head = head.next
    old_head.datum
  end

  def size
    return 0 unless !!head
    return 1 unless !!head.next

    list_size = 1
    cur_item = head
    until cur_item.next.nil?
      list_size += 1
      cur_item = cur_item.next
    end

    list_size
  end

  def empty?
    size.zero?
  end

  def peek
    head.nil? ? head : head.datum
  end

  def reverse
    SimpleLinkedList.from_a(to_a.reverse)
  end

  def to_a
    arr = []
    return arr if empty?

    cur_item = head
    while !!cur_item
      arr << cur_item.datum
      cur_item = cur_item.next
    end

    arr
  end

  def self.from_a(arr)
    new_list = SimpleLinkedList.new
    return new_list if arr.nil?

    arr.reverse.each do |ele|
      new_list.push(ele)
    end

    new_list
  end
end
