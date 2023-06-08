# Custom Set
# Create a custom set type.
# 
# Sometimes it is necessary to define a custom data structure of some type, like a set. In this exercise you will define your own set type. How it works internally doesn't matter, as long as it behaves like a set of unique elements that can be manipulated in several well defined ways.
# 
# In some languages, including Ruby and JavaScript, there is a built-in Set type. For this problem, you're expected to implement your own custom set type. Once you've reached a solution, feel free to play around with using the built-in implementation of Set.
# 
# For simplicity, you may assume that all elements of a set must be numbers.


## Problem ##
# instance method logic laid out below class definition


## Data Structures

require "pry-byebug"

class CustomSet
  def initialize(vals=[])
    @values = vals
  end

  def empty?
    values.empty?
  end

  def contains?(value)
    values.include?(value)
  end

  def intersection(set)
    inter = []
    values.each do |value|
      inter << value if set.contains?(value)
    end

    CustomSet.new(inter)
  end

  def union(set)
    CustomSet.new((values + set.values).uniq)
  end

  def subset?(set)
    self.intersection(set).eql?(self)
  end

  def disjoint?(set)
    self.intersection(set).empty?
  end

  def eql?(set)
    values.sort.uniq == set.values.sort.uniq
  end

  def add(value)
    self.values << value
    self
  end

  def difference(set)
    dif = []
    values.each do |value|
      dif << value unless set.contains?(value)
    end

    CustomSet.new(dif)
  end

  def ==(other)
    self.eql?(other)
  end

  protected

  attr_reader :values
end

#set1 = CustomSet.new([1, 2, 3, 4])
#set1.add(2)
#p set1

## Observations from provided test cases ##
# Methods we will need
#   1) constructor method - can take 1 optional argument, an array of 1 or more numbers. 
#   2) empty? - checks if the set object has no elements
#   3) contains? - 1 argument, checks if it is one of the elements in the set object
#   4) subset? - 1 arguments - a `Set` object` - checks if all of the elements for the receiving `Set` object are included in the argument, returns `true` if so, else `false`
## Algorithm ##
# maybe leverage union or intersection?
#   > perhaps, check if the intersection fo the receiver with the argument is equal to the receiver
#
#   5) disjoint? - 1 argument, a `Set` object - returns `true` if no elements of the receiving `Set` object are included in the argument, `false` otherwise
## Algorithm ##
#   > invoke intersection and check that the result is empty
#   6) eql? (1 argument, a `Set` object) - returns `true` if the sorted unique elements of the receiver match the sorted unique objects of the argument, `false` otherwise
#   7) add (1 argument, any value) - adds the value to the list of elements for the set
#   8) intersection(1 argument, a `Set` object) - returns a new `Set` object containing the elements contained in both the receiver and the argument
#   > brute force - initialize an empty array, iterate over the receiver's elements and add any to the array that are included in the argument's element list
#   9) difference (1 argument, a `Set` object) - returns a new `Set` object, elements are determined by excluding any elements from the receiver that are also included in the argument
#   10) union (1 argument, a `Set` object) - returns a new `Set` object, elements are determined by combining the elements from both the receiver and the argument and then removing any duplicates
#     > Leverage the add method for arrays and then return the unique resulting values


## Data structures ##
# Keep the values in an Array object


## Algorithm ##
# a number of methods seem like they could be solved "together"
# intersection, union, difference, disjoint, subset