# Divisors
# Write a method that returns a list of all of the divisors of the positive integer passed in as an argument. The return value can be in any sequence you wish.

# Examples

def timer
  x = Time.now
  yield
  y = Time.now
  puts x - y
end

def divisors(int)
  1.upto(int / 2).select do |num|
    int % num == 0
  end
end

# divisors(1) == [1]
# divisors(7) == [1, 7]
# divisors(12) == [1, 2, 3, 4, 6, 12]
# divisors(98) == [1, 2, 7, 14, 49, 98]
# divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute

def divisors_fast(int)
  result = []

  1.upto(Math.sqrt(int)) do |num|
    if int % num == 0
      result << num
      result << int / num
    end
  end
  
  result.uniq.sort
end

timer { p divisors_fast(1) == [1] }
timer { p divisors_fast(7) == [1, 7] }
timer { p divisors_fast(12) == [1, 2, 3, 4, 6, 12] }
timer { p divisors_fast(98) == [1, 2, 7, 14, 49, 98] }
timer { p divisors_fast(99400891) == [1, 9967, 9973, 99400891] } # may take a minute

timer { p divisors_fast(99400891) == [1, 9967, 9973, 99400891] }
timer { p divisors_fast(999962000357) == [1, 999979, 999983, 999962000357] }
timer { p divisors_fast(9898004545065487) == [1, 239, 9733, 2326187, 4255033901, 1016953102339, 41414244958433, 9898004545065487] }