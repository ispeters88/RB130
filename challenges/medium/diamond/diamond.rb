# Diamond
# The diamond exercise takes as its input a letter, and outputs it in a diamond shape. Given a letter, it prints a diamond starting with 'A', with the supplied letter at the widest point.

# The first row contains one 'A'.
# The last row contains one 'A'.
# All rows, except the first and last, have exactly two identical letters.
# The diamond is horizontally symmetric.
# The diamond is vertically symmetric.
# The diamond has a square shape (width equals height).
# The letters form a diamond shape.
# The top half has the letters in ascending order.
# The bottom half has the letters in descending order.
# The four corners (containing the spaces) are triangles.


class Diamond
  ALPHABET = ("A".."Z").to_a

  def self.make_diamond(letter)
    width, idx = diamond_width(letter), 0
    top_half(width) + bottom_half(width)
  end

  def self.top_half(width)
    half, index = '', 0

    loop do
      half << build_row(width, index)
      index += 1
      break if index > width / 2
    end

    half
  end

  def self.bottom_half(width)
    half, index = '', width / 2

    loop do
      index -= 1
      break if index < 0
      half << build_row(width, index)
    end

    half
  end

  def self.diamond_width(letter)
    (ALPHABET.find_index(letter) + 1) * 2 - 1
  end

  def self.build_row(width, index)
    center = index == 0 ? "A" : ALPHABET[index] + center_fill(width, index) + ALPHABET[index]
    side_fill = ' ' * ((width - center.length) / 2)
    
    side_fill + center + side_fill + "\n"
  end

  def self.center_fill(width, index)
    ' ' * (2 * index - 1)
  end
end

loop do
  puts "Enter a letter to build a diamond out of"
  letter = gets.chomp.upcase
  break if letter == 'q'
  puts Diamond.make_diamond(letter)
end


## Algorithm ##
# 1) Get the width of the diamond, assign this to `width`
# 2) Initialize a counter variable `idx` to 0
# 3) Initialize an empty string and point to variable `diamond`
# 4) Iterate from 0 to the index position of the input letter. On each iteration
#     > build a row
#     > add the row to `diamond`
# 5) Iterate from index positon of the input letter - 1, to 0. On each iteration:
#     > build a row
#     > add the row to `diamond`
# 6) Return `diamond`



## Things to do ##
# Determine the width of the diamond
#   > Can use the position of the letter in the alphabet to get this
# Keep track of the amount of left/right space as well as center space

# > Should probably utilize a "build_row" type of method to create each row. Things we need to know for a row:
#   1) how much left and right justified white space to use (should be same value)
#       > fill_length_side
#   2) how much center whitespace to use
#       > fill_length_center
# And then each row needs a \n at the end


## Width of diamond ##
# perhaps:  2 * number of letters - 1 ?
#   seems accurate


## Space between two repeating (non-"A") characters ##
# This should also be 2 * n - 1
#     > Where `n` is the "index" position of the letter. eg. index of "B" is 1, "C" is 2

