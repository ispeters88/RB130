# Perfect Number
# The Greek mathematician Nicomachus devised a classification scheme for natural numbers (1, 2, 3, ...), identifying each as belonging uniquely to the categories of abundant, perfect, or deficient based on a comparison between the number and the sum of its positive divisors (the numbers that can be evenly divided into the target number with no remainder, excluding the number itself). For instance, the positive divisors of 15 are 1, 3, and 5. This sum is known as the Aliquot sum.
# 
# Perfect numbers have an Aliquot sum that is equal to the original number.
# Abundant numbers have an Aliquot sum that is greater than the original number.
# Deficient numbers have an Aliquot sum that is less than the original number.



class PerfectNumber
  def self.classify(n)
    raise StandardError unless n > 0 && n.class == Integer

    case aliquot_sum(n) <=> n
    when 0 then 'perfect'
    when 1 then 'abundant'
    when -1 then 'deficient'
    end
  end

  private

# LS Solution notes that the private keyword doesn't apply to class methods. 
# The workaround is to use
# class << self
#   private
#   method definition (without `self` prefix)

  def self.aliquot_sum(n)
    divs = []
    1.upto(n - 1) { |num| divs << num if n % num == 0 }
    divs.sum
  end
end

p PerfectNumber.aliquot_sum(124)


## Examples ##
# 
# 6 is a perfect number since its divisors are 1, 2, and 3, and 1 + 2 + 3 = 6.
# 28 is a perfect number since its divisors are 1, 2, 4, 7, and 14 and 1 + 2 + 4 + 7 + 14 = 28.
# 15 is a deficient number since its divisors are 1, 3, and 5 and 1 + 3 + 5 = 9 which is less than 15.
# 24 is an abundant number since its divisors are 1, 2, 3, 4, 6, 8, and 12 and 1 + 2 + 3 + 4 + 6 + 8 + 12 = 36 which is greater than 24.
# Prime numbers 7, 13, etc. are always deficient since their only divisor is 1.
# Write a program that can tell whether a number is perfect, abundant, or deficient.


## Algorithm ##

# Given an input num, `n`
# 1) Get the Aliquot sum (sum of positive divisors of `n`)
# 2) Compare `aliquot_sum` to `n` and return one of three strings based on the comparison result:
#     > If equal, return 'perfect'
#     > If `aliquot_sum` > `n`, return 'abundant'
#     > If `aliquot_sum` < `n`, return 'deficient'


# Aliquot Sum
# Given an input num, `n`
#   1) Initialize an empty array, `divs`
#   2) Iterate over all numbers from 1 to `n`. On each iteration
#       > Check if the current number is a divisor of `n`. If so, add it to `divs`
#   3) Calculate the sum of the values in `divs` and return that value