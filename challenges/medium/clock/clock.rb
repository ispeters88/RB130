# Clock
# Create a clock that is independent of date.
# 
# You should be able to add minutes to and subtract minutes from the time represented by a given Clock object. Note that you should not mutate Clock objects when adding and subtracting minutes -- create a new Clock object.
# 
# Two clock objects that represent the same time should be equal to each other.
# 
# You may not use any built-in date or time functionality; just use arithmetic operations.

## Problem ##
# Create a class `Clock`
# With the following methods:
#   1) to_s method - this should output a string representation of the time in HH:MM format. So if the hour is 15 and the minutes are 30, we should output '15:30'.
#   2) `at` instance method - this should accept one required argument for hours and one optional argument for minutes
#       > perhaps this should just call a constructor method?
#   3) an `==` method to check equality between two clock objects
#   4) a `+` instance method - calculate the effect of adding a given number of minutes to the time value for a clock object
#   5) a `-` instance method - calculate the effect of subtracting a given number of minutes from the time value for a clock object

class Clock
  def initialize(hours, minutes)
    @hours = hours
    @minutes = minutes
  end

  def self.at(hours, minutes=0)
    Clock.new(hours, minutes)
  end

  def to_s
    "#{hours.to_s.rjust(2, '0')}:#{minutes.to_s.rjust(2, '0')}"
  end

  def ==(other)
    hours == other.hours && minutes == other.minutes
  end

  def +(mins)
    add_hrs, add_mins = mins.divmod(60)
    new_hours = (hours + add_hrs).divmod(24).last
    new_mins = (minutes + add_mins).divmod(60).last

    Clock.new(new_hours, new_mins)
  end

  def -(mins)
    sub_hrs, sub_mins = mins.divmod(60)
    sub_hrs += 1 if sub_mins > minutes
    new_hours = (hours - sub_hrs).divmod(24).last
    new_mins = (minutes - sub_mins).divmod(60).last

    Clock.new(new_hours, new_mins)
  end

  protected

  attr_reader :hours, :minutes
end


## Algorithm ##

# For `-` and `+` methods:

# `#+`
# Need to leverage division by 60 (for minutes) and 24 (hours), along with remainders, to simplify the calculation
# Given an input integer, `n`:
#   1) Find the quotient and remainder of `n / 60`. Assign the former to `add_hrs` and the latter to `add_mins`
#   2) Find the "relevant" hours by calculating the remainder of  `(@hours + add_hrs) / 24`. This will be the hours value for the new clock object. Similarly, calculate the remainder of `(@minutes + add_mins) / 60`. This is the minutes value for the new clock object.
#   3) Create a new clock object using these hours and minutes values.

# `#-`
# Given an input integer, `n`:
#   1) Find the quotient and remainder of `n / 60`. Assign the former to `sub_hrs` and the latter to `sub_mins`
#   2) Check if `sub_mins` is greater than the integer representation of `minutes`. If so, add 1 to `sub_mins`