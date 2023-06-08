# Beer Song

# Write a program that can generate the lyrics of the 99 Bottles of Beer song. See the test suite for the entire song.


## Problem ##

# This class implements a repetitive drinking song in which the lyrics list off a specific number of beer bottles, indicate a removal of one beer bottle, and then report back the remaining number of beer bottles. The default starting point is 99 beer bottles, and the default end point is 0 bottles (which should be narrated as "no more" rather than 0)

# Need a class `BeerSong`, with three class methods:
#   1) `BeerSong::lyrics`
#       > Takes no arguments.
#       > Outputs the full song - aka all verses, starting at verse 99
#   2) `BeerSong::verse`
#       > Takes one arguments, start verse
#   3) `BeerSong::verses`
#       > Takes two arguments, start and end verse
#       > Outputs the song, starting at the `start` verse and ending at the `end` verse

# rules
#  1) 

class BeerSong
  def self.lyrics
    verses(99,0)
  end

  def self.verse(num)
    "#{count(num).capitalize} #{plurality(num)} of beer on the wall, #{count(num)} #{plurality(num)} of beer.\n" \
    "#{next_step(num)}, #{next_count(num)} #{plurality(num - 1)} of beer on the wall.\n"
  end

  def self.verses(first, last)
    song = ''
    first.downto(last) do |num|
      song << verse(num)
      song << "\n" unless num == last
    end

    song
  end

  private

  def self.count(num)
    num.zero? ? "no more" : num.to_s
  end

  def self.plurality(num)
    num == 1 ? "bottle" : "bottles"
  end

  def self.next_step(num)
    noun = num == 1 ? "it" : "one"
    num.zero? ? "Go to the store and buy some more" : "Take #{noun} down and pass it around"
  end

  def self.next_count(num)
    next_num = num - 1
    next_num.negative? ? "99" : count(next_num)
  end
end

## Algorithm ##
# `BeerSong::lyrics`
#       > Simply call `BeerSong.lyrics(99, 0)`
# `BeerSong::verse`
#       > Use argument names `first` and `last`. Set default of `last` argument to be the value of `first`

# 1) Initialize an empty string object, `song`
# 2) Iterate from the number pointed to by `first` down to the number pointed to by `last`. On each iteration
#     > If the current iterative value is 0, append the following to `song`:
# 'No more bottles of beer on the wall, no more bottles of beer.\nGo to the store and buy some more, 99 bottles of beer on the wall.\n'
#     > Elsif the current iterative value is 1, append to `song`, 
# '1 bottle of beer on the wall, 1 bottle of beer.\nTake it down and pass it around, no more bottles of beer on the wall.\n'
#     > Else append to `song`, where `num` is the current iterative value:
# '#{num} bottles of beer on the wall, #{num} bottles of beer.\nTake one down and pass it around, #{num - 1} bottles of beer on the wall.\n'


## Refactor of above logic ##
# Need to handle two edge cases. If we generalize the portions of each verse that state the number of bottle(s) to {number} {bottle plurality}, then the edge cases are handled as follows:
#   1) current iterative count is 0: number = "No more", bottle plurality = 'bottles'
#   2) current iterative count is 1: number = "1", bottle plurality = 'bottle'

# Also need to handle edge case of the "next step" the verse indicates after taking a bottle down. When the current value is 0, we have a different next step than for any other current value

## Collaborating data structures ##
# Use an iterative function to count down from the starting number to the ending number
# 


