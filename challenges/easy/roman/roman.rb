require "pry"

puts $LOADED_FEATURES.grep(/pry\.rb/)

class RomanNumeral
  ROMANS = {
    1000 => "M",
    900 => "CM",
    500 => "D",
    400 => "CD",
    100 => "C",
    90 => "XC",
    50 => "L",
    40 => "XL",
    10 => "X",
    9 => "IX",
    5 => "V",
    4 => "IV",
    1 => "I"
  }

  ROMAN_KEYS = ROMANS.keys
  LARGEST_KEY = ROMAN_KEYS.first

  def initialize(num)
    @num = num
  end

  def to_roman
    roman = ''
    arab = @num.dup
    #binding.pry

    loop do
      p_key = get_prior_key(arab)
      if arab > LARGEST_KEY
        next_char = ROMANS[LARGEST_KEY] * (arab / LARGEST_KEY)
        reduce = LARGEST_KEY * (arab / LARGEST_KEY)
      else
        next_char = ROMANS[p_key]
        reduce = p_key
      end
      
      roman << next_char
      arab -= reduce

      break if arab == 0
    end
    roman
  end

  def get_prior_key(i)
    ROMAN_KEYS.find_all { |key| key <= i }.first
  end
end


## Algorithm 2.0 ##

# 1) initialize an empty string, `roman`
# 2) Find the highest roman key that is less than the input `num`. If there is no such key, calculate `num` / highest key. Subtract the key used from `num`
# 3) Append the value for the identified key from te roman numeral hash, to `roman`
# 4) return `roman`


## Examples ##
=begin
num1 = 4594
num2 = 3999
num3 = 994
num4 = 1746

rom1 = RomanNumeral.new(num1)
rom2 = RomanNumeral.new(num2)
rom3 = RomanNumeral.new(num3)
rom4 = RomanNumeral.new(num4)

p rom1.to_roman
p rom2.to_roman
p rom3.to_roman
p rom4.to_roman
=end