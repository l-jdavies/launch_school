# For this exercise, we'll be learning and practicing our knowledge of the arity of lambdas, procs, and implicit blocks. Two groups of code also deal with the definition of a Proc and a Lambda, and the differences between the two. Run each group of code below: For your answer to this exercise, write down your observations for each group of code. After writing out those observations, write one final analysis that explains the differences between procs, blocks, and lambdas.

# Group 1
my_proc = proc { |thing| puts "This is a #{thing}." }
puts my_proc
puts my_proc.class
my_proc.call
my_proc.call('cat')

puts "###################################"


# A proc object can be initialized by stating proc followed by a block, you don't have to call Proc.new
# Procs have lenient arity rules - passing in a different number of arguments doesn't raise an Argument Error


# Group 2
my_lambda = lambda { |thing| puts "This is a #{thing}." }
my_second_lambda = -> (thing) { puts "This is a #{thing}." }
puts my_lambda
puts my_second_lambda
puts my_lambda.class
my_lambda.call('dog')
#my_lambda.call
#my_third_lambda = Lambda.new { |thing| puts "This is a #{thing}." }

puts "###################################"
# Lambdas are initialized by invoking kernel#lambda followed by a block
# You can't initialize an instance of a Lambda by invoking Lambda.new because Lambda objects are creating by invoking a Kernel method and Kernel is a module - not a class
# line 19 a Lambda object is initialized by it's not calling the Kernel#lambda method - not sure why defining the block variable (thing) within parenthesis means Ruby creates a lambda, not Proc
# From the Ls solution is appears you can initialize a lambda with `lambda {}` or `-> () {}`
# This group demonstrates Lambdas have strict arity rules.


# Group 3
def block_method_1(animal)
  yield
end

block_method_1('seal') { |seal| puts "This is a #{seal}."}
#block_method_1('seal')

puts "#####################################"

# on line 39 yield was called without passing in an argument so the block parameter seal evaluated to nil, which is interpreted as an empty string.
# on line 40 no block was passed into the method so invoking yield raised a NoJumpError

# Group 4
def block_method_2(animal)
  yield(animal)
end

block_method_2('turtle') { |turtle| puts "This is a #{turtle}."}
block_method_2('turtle') do |turtle, seal|
  puts "This is a #{turtle} and a #{seal}."
end
block_method_2('turtle') { puts "This is a #{animal}."}

# line 52 outputs "This is a turtle" as the string 'turtle' was passed into the method as an argument
# line 53 outputs "This is a turtle and a  ." because the block has two parameters but only one argument was passed in. No value was assigned to the second parameter so it returns nil, which evaluates as an empty string.
# line 56 raises a No method error because the block hasn't been defined with a block parameter but is using string interpolation to return the value of `animal` which hasn't been defined anywhere.
