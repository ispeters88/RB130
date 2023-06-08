# Bubble Sort with Blocks
# In an earlier exercise, you were asked to construct a #bubble_sort! method that used the bubble sort algorithm to sort Arrays in place

=begin


The problem with this solution is that it doesn't give you any freedom in terms of the criteria used for the sort. For example, perhaps you want to sort the Array in reverse order from usual, or perhaps you want to sort a list of names in a case-insensitive manner.

Your task in this assignment is to modify #bubble_sort! so it takes an optional block that determines which of two consecutive elements will appear first in the results.

If you still have a copy of your #bubble_sort! method, you may use that method as the basis for this exercise. Otherwise, you can use the above solution.

=end

def bubble_sort_old!(arr)
  loop do
    swapped = false
    (1...arr.size).each do |idx|
      if arr[idx] < arr[idx - 1]
        temp = arr[idx - 1]
        arr[idx - 1] = arr[idx]
        arr[idx] = temp
        swapped = true
      end
    end
    break if swapped == false
  end
  arr
end



def bubble_sort!(arr)
  loop do
    swapped = false
    (1...arr.size).each do |index|
      if block_given?
        next if yield(arr[index - 1], arr[index])
      else
        next if arr[index - 1] <= arr[index]
      end

      arr[index - 1], arr[index] = arr[index], arr[index - 1]
      swapped = true
    end

    break unless swapped
  end
end

## Examples ##


array = [5, 3]
bubble_sort!(array)
p array == [3, 5]

array = [5, 3, 7]
bubble_sort!(array) { |first, second| first >= second }
p array == [7, 5, 3]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

array = [6, 12, 27, 22, 14]
bubble_sort!(array) { |first, second| (first % 7) <= (second % 7) }
p array == [14, 22, 12, 6, 27]

array = %w(sue Pete alice Tyler rachel Kim bonnie)
bubble_sort!(array)
p array == %w(Kim Pete Tyler alice bonnie rachel sue)

array = %w(sue Pete alice Tyler rachel Kim bonnie)
bubble_sort!(array) { |first, second| first.downcase <= second.downcase }
p array == %w(alice bonnie Kim Pete rachel sue Tyler)


# Further Exploration
# Modify your solution so it only passes one element to the block at a time; the block should perform some sort of transformation to the argument, and #bubble_sort! itself should just use <= to compare two values. In other words, you should be able to call #bubble_sort! like this:

def bubble_sort_fe!(arr)
  loop do
    swapped = false
    (1...arr.size).each do |index|
      if block_given?
        next if yield(arr[index - 1]) <= yield(arr[index])
      else
        next if arr[index - 1] <= arr[index]
      end

      arr[index - 1], arr[index] = arr[index], arr[index - 1]
      swapped = true
    end

    break unless swapped
  end
end

array = %w(sue Pete alice Tyler rachel Kim bonnie)
bubble_sort_fe!(array) { |value| value.downcase }
p array == %w(alice bonnie Kim Pete rachel sue Tyler)

# very interesting solution

def bubble_sort_by_fe2!(arr)
  arr.map! { |ele| block_given? ? [ele, yield(ele)] : [ele, ele] }
  bubble_sort!(arr) { |a, b| a[1] <= b[1] }
  arr.map! { |ele| ele[0] }
end