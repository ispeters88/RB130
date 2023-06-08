# Anagrams
# Write a program that takes a word and a list of possible anagrams and selects the correct sublist that contains the anagrams of the word.

# For example, given the word "listen" and a list of candidates like "enlists", "google", "inlets", and "banana", the program should return a list containing "inlets". Please read the test suite for the exact rules of anagrams.

class Anagram
  def initialize(word)
    @word = word.downcase
  end

  def match(arr)
    results = []
    arr.each { |el| results << el if is_anagram?(el) }
    results
  end

  private

  def is_anagram?(str)
    @word.chars.tally == str.downcase.chars.tally && str.downcase != @word
  end
end

## Algorithm ##
# Anagram#match should return all elements of the input array that are an anagram of @word
#   1) initialize an empty array `results`
#   2) Iterate over the elements in the input array. On each iteration
#       > if the current element is an anagram of @word, add it to `results``
#   3) Return `results`

# Confirming if a word is an anagram
#
# Criteria:
#   1) size of string must be the same
#   2) counts (aka tally) of letters must be the same

## Note - need this to be case insensitive
