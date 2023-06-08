require 'minitest/autorun'

require_relative 'dog'

require "pry-byebug"

class DogTest < MiniTest::Test
  def setup
    @spot = Dog.new('Spot')
  end

  def is_dog_test; end

  def name_test; end

  def test_bark
    exp = "Woof!"
    assert_equal(exp, @spot.bark)
  end

  def raises_error_test; end
end