# Sum of Multiples
# Write a program that, given a natural number and a set of one or more other numbers, can find the sum of all the multiples of the numbers in the set that are less than the first number. If the set of numbers is not given, use a default set of 3 and 5.
# 
# For instance, if we list all the natural numbers up to, but not including, 20 that are multiples of either 3 or 5, we get 3, 5, 6, 9, 10, 12, 15, and 18. The sum of these multiples is 78.

## Problem ##
# input - natural number `n` and set of one or more other numbers, `nums`
# output - sum of all the multiples in `nums` that are less than `n`
# rules 
#   1) default for `nums` if none provided is [3, 5]
#   2) DON'T REPEAT SET MULTIPLES! If a value is a multiple of more than one of the numbers from the set, only add it to the sum once

# Have to implement three methods:
#   1) class method `to` - should take one argument, a natural number
#   2) instance method 'to' - should take one argument, a natural number
#   3) constructor method - should take a list of one or more numbers

require "pry-byebug"

class SumOfMultiples
  def initialize(*nums)
    @nums = nums.size > 0 ? nums : [3, 5]
  end

  def to(n)
    multiples = []
    nums.each do |num|
      mult = 1
      loop do
        break unless mult * num < n
        product = mult * num
        multiples << product unless multiples.include?(product)
        mult += 1
      end
    end

    multiples.sum
  end

  def self.to(n)
    som = SumOfMultiples.new(3, 5)
    som.to(n)
  end

  private
  attr_reader :nums
end

## Algorithm ##
# SumOfMultiples#to
# Given an input number, `n`
# 1) Initialize a variable `multiples` to an empty Array object
# 2) Iterate over the numbers in the instance variables `nums` for the receiving object instance. On each iteration:
#     > Iterate using a counter `mult`, starting at the value 1.
#       > Check if the current iterative value * `mult` is >= `n`. If so, break out of iteration
#       > Else, check if value * `mult` is already defined in the `multiples` Array. If not, add it
#       > Increment `mult` by 1
# 3) Return the sum of the `multiples` array

# SumOfMultiples::to
#   1) Initialize a new SumOfMultiples object instance, with the arguments (3, 5). Save it to a local variable
#   2) call SumOfMultiples#to on that object