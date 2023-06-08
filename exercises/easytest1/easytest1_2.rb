# Equality Assertions
# Write a minitest assertion that will fail if value.downcase does not return 'xyz'.

assert_equal('xyz',value.downcase,)

# Failure messages issued by #assert_equal assume that the first argument represents the expected value, while the second argument represents the actual value to be tested. It's important to maintain this convention so that failure messages make sense.