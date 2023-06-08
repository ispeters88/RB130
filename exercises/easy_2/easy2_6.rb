=begin
each_with_index
The Enumerable#each_with_index method iterates over the members of a collection, passing each element and its index to the associated block. The value returned by the block is not used. each_with_index returns a reference to the original collection.

Write a method called each_with_index that behaves similarly for Arrays. It should take an Array as an argument, and a block. It should yield each element and an index number to the block. each_with_index should return a reference to the original Array.

Your method may use #each, #each_with_object, #inject, loop, for, while, or until to iterate through the Array passed in as an argument, but must not use any other methods that iterate through an Array or any other collection.

=end

## Problem ##
# input - array
# output - a reference to the input array
# rules
#   1) take but don't require a block. if no block given, return value should be an Enumerator object
#   2) yield each element and corresponding index number to block
#   3) return a reference to the original array

def each_with_index(arr)
  puts "Returned Enumerator.new" unless block_given?

  arr.each_with_index do |item, idx|
    yield(item, idx)
  end

  arr
end

## Examples ##
result = each_with_index([1, 3, 6, 9]) do |value, index|
  puts "#{index} -> #{value**index}"
end

puts result == [1, 3, 6, 9]

## Data/Algorithm ##
# 1) Check if a block has been given. If not, immediately return an Enumerator object
# 2) Iterate over the input array `arr`, with the index value available. On each iteration
#     > yield the element and index value to the block
# 3) return the array passed in as an argument