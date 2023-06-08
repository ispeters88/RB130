=begin
Iterators: True for One?
In the previous 3 exercises, you developed methods called any?, all?, and none? that are similar to the standard Enumerable methods of the same names. In this exercise, you will develop one last method from this family, one?.

Enumerable#one? processes elements in a collection by passing each element value to a block that is provided in the method call. If the block returns a truthy value for exactly one element, then #one? returns true. Otherwise, #one? returns false. Note in particular that #one? will stop searching the collection the second time the block returns true.

Write a method called one? that behaves similarly for Arrays. It should take an Array as an argument, and a block. It should return true if the block returns true for exactly one of the element values. Otherwise, it should return false.

Your method should stop processing elements of the Array as soon as the block returns true a second time.

If the Array is empty, one? should return false, regardless of how the block is defined.

Your method may not use any standard ruby method that is named all?, any?, none?, or one?.

=end


def one?(collection, &block)
  collection.count(&block) == 1
end

def one_2?(collection)
  truths = 0

  collection.each do |item|
    truths += 1 if yield(item)
    return false if truths > 1
  end

  truths == 1
end

## Examples ##

p one_2?([1, 3, 5, 6]) { |value| value.even? }    # -> true
p one_2?([1, 3, 5, 7]) { |value| value.odd? }     # -> false
p one_2?([2, 4, 6, 8]) { |value| value.even? }    # -> false
p one_2?([1, 3, 5, 7]) { |value| value % 5 == 0 } # -> true
p one_2?([1, 3, 5, 7]) { |value| true }           # -> false
p one_2?([1, 3, 5, 7]) { |value| false }          # -> false
p one_2?([]) { |value| true }                     # -> false