=begin

Exploring Procs, Lambdas, and Blocks: Definition and Arity
This exercise covers material that you do not have to master. We provide the exercise as a way to explore the differences between procs, lambdas, and blocks.

For this exercise, we'll be learning and practicing our knowledge of the arity of lambdas, procs, and implicit blocks. Two groups of code also deal with the definition of a Proc and a Lambda, and the differences between the two. Run each group of code below: For your answer to this exercise, write down your observations for each group of code. After writing out those observations, write one final analysis that explains the differences between procs, blocks, and lambdas.

=end

require "pry-byebug"
=begin

# Group 1
my_proc = proc { |thing| puts "This is a #{thing}." }
puts my_proc
puts my_proc.class
my_proc.call
my_proc.call('cat')

# Procs have lenient arity
# Output value is the last expression in the block
# Procs are created via Proc.new or proc

=end

#binding.pry
=begin
# Group 2
my_lambda = lambda { |thing| puts "This is a #{thing}." }
my_second_lambda = -> (thing) { puts "This is a #{thing}." }
puts my_lambda
puts my_second_lambda
puts my_lambda.class
my_lambda.call('dog')
my_lambda.call
my_third_lambda = Lambda.new { |thing| puts "This is a #{thing}." }

# Lambdas have strict arity
# Output value is the last expression in the block
# `Lambda` is not a standard class - lambdas are instances of the `Proc` class
# Lambdas are created via `lambda` keyword or `->`



# Group 3
def block_method_1(animal)
  yield
end

block_method_1('seal') { |seal| puts "This is a #{seal}."}
block_method_1('seal')

# If no arguments are supplied to the `yield` keyword, the block will have no access to the yielding methods local variables when it is yielded to
# If a method uses the yield keyword, it must be supplied a block, else a LocalJumpError exception will be raised
# Methods have strict arity

# Group 4
def block_method_2(animal)
  yield(animal)
end

block_method_2('turtle') { |turtle| puts "This is a #{turtle}."}
block_method_2('turtle') do |turtle, seal|
  puts "This is a #{turtle} and a #{seal}."
end
block_method_2('turtle') { puts "This is a #{animal}."}

# Blocks have lenient arity
# We have to declare block parameters for variables scoped to the yielding method to be accessible
# 


## Final Analysis ##
# The primary differences between blocks, procs, and lambdas lie in:
#   1) arity: ie. how strictly Ruby enforces the expected number of arguments supplied. procs and blocks have lenient arity, meaning they can be called with any number of arguments; those that are unneeded will be ignored. Lambdas have strict arity, meaning an exception will be raised if the number of arguments passed is different than expected by the Lambda definition.
#   2) data types: blocks are not objects; procs and lambdas are (they are instances of the `Proc` class)

=end

