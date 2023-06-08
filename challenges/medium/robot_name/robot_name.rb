## Problem Description ##
# Robot Name
# Write a program that manages robot factory settings.
# 
# When robots come off the factory floor, they have no name. The first time you boot them up, a random name is generated, such as RX837 or BC811.
# 
# Every once in a while, we need to reset a robot to its factory settings, which means that their name gets wiped. The next time you ask, it will respond with a new random name.
# 
# The names must be random; they should not follow a predictable sequence. Random names means there is a risk of collisions. Your solution should not allow the use of the same name twice.

## Problem Statement ##
# input - 
# output - 
# rules + reqs - 
#     1) each robot name should follow a strict pattern: Two uppercase letters follow by 3 digits
#         > can steal the naming regex to manage this
#     2) need to be able to read and write the value of a state variable called `name`

## Notes ##
# we know on tests where Kernel#srand is used, we can't use the rand command - or at least we have to reset in between them

class Robot
  LETTERS = ('A'..'Z').to_a
  NUMS = ('0'..'9').to_a
  @@used_names = []

  attr_reader :name

  def initialize
    build_name
  end

  def reset
    @@used_names.delete(@name)
    build_name
  end

  private

  def build_name
    name = ''

    loop do
      2.times { name << LETTERS.sample }
      3.times { name << NUMS.sample }
      if name_available?(name)
        add_to_used_names(name)
        @name = name
        break
      else
        name = ''
      end
    end
  end

  def name_available?(name)
    !(@@used_names.include?(name))
  end

  def add_to_used_names(name)
    @@used_names << name
  end
end