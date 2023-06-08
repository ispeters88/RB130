=begin

max_by
The Enumerable#max_by method iterates over the members of a collection, passing each element to the associated block. It then returns the element for which the block returned the largest value.

Write a method called max_by that behaves similarly for Arrays. It should take an Array and a block, and return the element that contains the largest value.

If the Array is empty, max_by should return nil.

Your method may use #each, #each_with_object, #each_with_index, #inject, loop, for, while, or until to iterate through the Array passed in as an argument, but must not use any other methods that iterate through an Array or any other collection.

=end

## Problem ##
# input - array
# output - element from input array, or nil
# rules
#   1) should accept an array
#   2) output value should be the element from the input array for which the block returned the largest value

require "pry-byebug"

def max_by(arr)
  return nil if arr.empty?
  result = [arr.first, yield(arr.first)]
  
  arr[1..].each do |item|
    blk_value = yield(item)
    result = [item, blk_value] if blk_value > result.last
  end

  result.first
end


## Examples ##

p max_by([1, 5, 3]) { |value| value + 2 } == 5
p max_by([1, 5, 3]) { |value| 9 - value } == 1
p max_by([1, 5, 3]) { |value| (96 - value).chr } == 1
p max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } == [3, 4, 5]
p max_by([-7]) { |value| value * 3 } == -7
p max_by([]) { |value| value + 5 } == nil

## Algorithm ##
# 1) Initialize a local variable `results`: a two item Array where the first value is the first element from the input array, and the second is the result of yielding that first element to the passed in block
# 2) Iterate over the values in the input array. On each iteration
#     > Yield to the block. If the resulting value is larger than `result`, set result to that value
# 3) Return `result`