# Meetups
# Meetups are a great way to meet people who share a common interest. Typically, meetups happen monthly on the same day of the week. For example, a meetup's meeting may be set as:
# 
# The first Monday of January 2021
# The third Tuesday of December 2020
# The tenth Wednesday of December 2020
# The last Thursday of January 2021
# In this program, we'll construct objects that represent a meetup date. Each object takes a month number (1-12) and a year (e.g., 2021). Your object should be able to determine the exact date of the meeting in the specified month and year. For instance, if you ask for the 2nd Wednesday of May 2021, the object should be able to determine that the meetup for that month will occur on the 12th of May, 2021.
# 
# The descriptors that may be given are strings: 'first', 'second', 'third', 'fourth', 'fifth', 'last', and 'teenth'. The case of the strings is not important; that is, 'first' and 'fIrSt' are equivalent. Note that "teenth" is a made up word. There was a meetup whose members realised that there are exactly 7 days that end in '-teenth'. Therefore, it's guaranteed that each day of the week (Monday, Tuesday, ...) will have exactly one date that is the "teenth" of that day in every month. That is, every month has exactly one "teenth" Monday, one "teenth" Tuesday, etc. The fifth day of the month may not happen every month, but some meetup groups like that irregularity.
# 
# The days of the week are given by the strings 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', and 'Sunday'. Again, the case of the strings is not important.


## Problem ##
# methods needed
#   1) constructor - takes two arguments, a year (4 digit value) and a month (value from 1-12)
#   2) instance method `Meetup#day` - takes two arguments, a day of the week, and a descriptor
# rules

require 'date'


class Meetup
  RECUR_PERIODS = ['first', 'second', 'third', 'fourth', 'fifth', 'last', 'teenth']
  RECUR_MULTS = { 'first' => 1, 'second' => 2, 'third' => 3, 'fourth' => 4, 'fifth' => 5 }

  def initialize(year, month)
    @year = year
    @month = month
  end

  def day(day, recur)
    result = find_date(day, recur)
    result.year == @year && result.month == @month ? result : nil
  end

  private

  attr_reader :year, :month

  def find_date(day, recur)
    first_target_day = get_first_target(day.capitalize)
    if RECUR_MULTS.keys.include?(recur.downcase)
      first_target_day + (7 * (RECUR_MULTS[recur.downcase] - 1))
    elsif recur == 'last'
      get_last_day(first_target_day) 
    else
      get_teenth(day.capitalize)
    end
  end

  def get_first_target(day)
    Date.new(@year, @month) + days_to_add(day)
  end

  def get_last_day(date)
    day_counter = date.day
    month_last = Date.new(@year, @month, -1).day

    loop do
      break if day_counter + 7 > month_last
      day_counter +=7
    end

    Date.new(@year, @month, day_counter)
  end

  def get_teenth(day)
    Date.new(@year, @month, 13) + days_to_add(day, 13)
  end

  def days_to_add(day, start=1)
    first_day_index = Date.new(@year, @month, start).wday
    target_day_index = Date::DAYNAMES.find_index(day)
    
    if first_day_index == target_day_index
      days_to_add = 0
    elsif first_day_index > target_day_index
      days_to_add = Date::DAYNAMES.size - first_day_index + target_day_index
    else
      days_to_add = target_day_index - first_day_index
    end
  end
end

meetup = Meetup.new(2015, 11)
p meetup.day('Thursday', 'fifth')

# meetup = Meetup.new(2017, 1)
# p meetup.day('Monday', 'third')
# p meetup.day('Thursday', 'teenth')

## Algorithm ##
# Determine the day of the week for the first day of a month
# If the given `recur` value is found in RECUR_MULTS, 
#   Adjust the day to the given `day` value * the value from RECUR_MULTS for `recur`
#
#     To do this: leverage the Date::DAYNAMES constant - this is an array of the names of the days
#     We can get the number of days in between two days of the week by doing:
#       If current day is later in the week than target day -
#         > 6 - (index position of the current day) + (index position of the target day) + 1
#       If current day is earlier in the week than target day -
#         > (index position of the target day) - (index position of the current day)
#     
#

# Elsif `recur` is 'last'
#   Adjust the day to the given `day` value, then add 7 until current day + 7 > (number of days in the month)
# Else
#   Separate algorithm for 'teenth'


# 'Teenth'
# brute force?
#   1) iterate from 13 to 19. break when the day of the week matches our input day
# slightly better, and more in keeping with the rest of my solution
#   1) determine the weekday of the 13th. Get the "days to add"
#       > note - "days to add" logic should be extracted to its own function (DRY)
