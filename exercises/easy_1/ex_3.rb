# Find Missing Numbers
# Write a method that takes a sorted array of integers as an argument, and returns an array that includes all of the missing # integers (in order) between the first and last elements of the argument.

# Examples:

def missing(nums)
  result = []

  (nums.first..nums.last).each do |num|
    result << num unless nums.include?(num)
  end

  result
end

p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []


def missing_clever(nums)
  (nums.first..nums.last).to_a - nums
end