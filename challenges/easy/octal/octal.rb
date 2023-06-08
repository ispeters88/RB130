class Octal
  VALID_CHARS = ('0'..'7').to_a

  def initialize(val)
    @num = val
    @chars = @num.chars
  end

  def to_decimal
    return 0 if @chars.any? { |char| !VALID_CHARS.include?(char) }
    digits = @chars.map(&:to_i)
    exp, idx, decimal = @chars.size - 1, 0, 0

    loop do
      decimal += (digits[idx] * (8 ** exp))
      exp -= 1
      idx += 1
      break if exp < 0
    end

    decimal
  end
end



## Algorithm ##
# > to_decimal
# Need to first do some validation. Input needs to not have any values outside of '0'-'7'
#   regex? range -> array?

# Iterate over the digits in the input number. Convert each to its octal equivalent based on its index
#
# Start at the number of digits - 1, and count down on each iteration. Use the counter as the exponent
