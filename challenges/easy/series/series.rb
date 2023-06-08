# Series
# Write a program that will take a string of digits and return all the possible consecutive number series of a specified length in that string.

## Problem ##
# input - 
#   1) string containing character representations of numeric digits, `str`
#   2) number, `n`
# output - 2d nested array, where each inner array is a `n`-length set of digits from `str` that are found consecutively in `str`
# rules
#   1) raise an argument error if `n` is strictly greater than `str.size`
#   2) if `n` is equal to `str.size`, there should be just one inner array in the output array

class Series
  def initialize(str)
    @digits = str.chars.map(&:to_i)
  end

  def slices(n)
    raise ArgumentError if n > digits.size
    digits.each_cons(n).to_a
  end

  private

  attr_reader :digits
end


## Examples ##

# For example, the string "01234" has the following 3-digit series:
# 
# 012
# 123
# 234
# Likewise, here are the 4-digit series:
# 
# 0123
# 1234
# Finally, if you ask for a 6-digit series from a 5-digit string, you should throw an error.

## Algorithm ##

# Create a class `Series` with two methods:
#   1) A constructor, which takes one argument - `str`
#   2) An instance method `Series#slices`, which takes one argument - `n`
## Constructor method
# Create an array of the numeric representation of the characters in `str` (in original order). Assign this array to an instance variable `@digits`
## `Series#slices`
# Given a numeric value `n`, 
#   1) raise an ArgumentError exception if `n` > `@digits.size`
#   2) Initialize an empty array object, `results`
#   3) Iterate over the values in `@digits` in chunks of size `n`. Add each chunk to `results`
#   4) Return `results`