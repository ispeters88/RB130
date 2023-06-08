=begin

drop_while
The Enumerable#drop_while method begins by iterating over the members of a collection, passing each element to the associated block until it finds an element for which the block returns false or nil. It then converts the remaining elements of the collection (including the element that resulted in a falsey return) to an Array, and returns the result.

Write a method called drop_while that behaves similarly for Arrays. It should take an Array as an argument, and a block. It should return all the elements of the Array, except those elements at the beginning of the Array that produce a truthy value when passed to the block.

If the Array is empty, or if the block returns a truthy value for every element, drop_while should return an empty Array.

Your method may use #each, #each_with_object, #each_with_index, #inject, loop, for, while, or until to iterate through the Array passed in as an argument, but must not use any other methods that iterate through an Array or any other collection.

=end

## Problem ##
# input - array
# output - new array
# rules
#   1) must accept a block
#   2) iterate over members of input collection. on each iteration
#       > yield the current element to the block
#       > if the block returns true, proceed with the next iteration
#       > if the block returns a falsy value, add it and the remaining values of the collection as an array.


def drop_while_enum(enum)
  drop, result = false, []

  enum.each do |item|
    if drop
      result << item
    elsif yield(item)
      next
    else
      result << item
      drop = true
    end
  end

  result
end

def drop_while(arr)
  result = []

  arr.each_with_index do |item, idx|
    return arr[idx..] unless yield(item)
  end

  result
end

## Examples ##

p drop_while([1, 3, 5, 6]) { |value| value.odd? } == [6]
p drop_while([1, 3, 5, 6]) { |value| value.even? } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| true } == []
p drop_while([1, 3, 5, 6]) { |value| false } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| value < 5 } == [5, 6]
p drop_while([]) { |value| true } == []

test_hash = {a: 1, b: 2, c: 3}

p drop_while_enum(test_hash) { |key, value| value.odd? }

## Data/Algorithm ##
# 1) initialize an empty array, result
# 2) initialize a light switch variable, drop, to false
# 3) iterate over collection. on each iteration
#     > yield to the block and check result
#     > if drop is true
#       > add current element to result
#     > elsif result is falsy
#       > set drop to true
#       > add current element to result
#     > otherwise
#       > move to next iteration
# 3) return result

