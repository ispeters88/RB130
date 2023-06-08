class Triangle
  def initialize(s1, s2, s3)
    @sides = [s1, s2, s3]
    raise ArgumentError.new unless valid_sides?
  end
  
  def kind
    case @sides.uniq.size
    when 1 then "equilateral"
    when 2 then "isosceles"
    else "scalene"
    end
  end

  private

  def valid_sides?
    valid_lengths = @sides.none? { |side| side <= 0 }
    valid_sums = @sides.none? { |side| side >= @sides.sum - side }

    valid_lengths && valid_sums
  end
end

## Algorithm ##

# to raise ArgumentError for invalid side definitions:

# 1) check if any side arguments are not > 0. if so, raise exception
# 2) check if any two sides sum to a value higher than the third
#     > form an array containing the three side values, `sides``
#     > generate a list of 2-element combinations of the side values
#     > iterate over this 2-d array. On each iteration
#         > form a new array, `third` from `sides` (original array of side values), by removing each of the values contained in the current inside, 2-element array
#         > check if the sum of the current 2-element array is greater than the remaining element in the new `third` array. if so, return true
# 3) if iteration completes, return false