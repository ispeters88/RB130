require "pry-byebug"

module Scoring
  SCORES = { ["A", "E", "I", "O", "U", "L", "N", "R", "S", "T"] => 1, 
             ["D", "G"] => 2,
             ["B", "C", "M", "P"] =>	3,
             ["F", "H", "V", "W", "Y"] =>	4,
             ["K"] =>	5,
             ["J", "X"]	=> 8,
             ["Q", "Z"] =>	10 }
end


class Scrabble
  include Scoring

  def initialize(word)
    @word = word
  end

  def score
    s = 0
    return s if @word.nil?

    @word.upcase.chars.each do |letter|
      s += score_for_letter(letter)
    end

    s
  end

  def self.score(word)
    Scrabble.new(word).score
  end

  private

  def score_for_letter(char)
    letter_index = SCORES.keys.find { |letters| letters.include?(char) }
    SCORES[letter_index] || 0
  end
end
