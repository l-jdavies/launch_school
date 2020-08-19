# In this exercise, your task is to create a new Enumerator object. When creating a new Enumerator, you may define what values are iterated upon. We'll want to create an Enumerator that can iterate over an infinite list of factorials. Once you make this new Enumerator, test it out by printing out the first 7 factorial values, starting with zero factorial.

# More specifically, print the first 7 factorials by using an "External Iterator". Once you have done so, see what happens if you print 3 more factorials (the results won't be correct). Now, reset your Enumerator (use the rewind method). Finally, print 7 more factorials.

########################################################################################
# useful resource: https://blog.carbonfive.com/enumerator-rubys-versatile-iterator/#:~:text=An%20external%20iterator%20is%20controlled,collection%20classes%2C%20Array%20and%20Hash%20.


# when instantiating a new enumerator, we can pass in a block that specifies which elements the enumerator object will iterate through
# the elements that the enumerator will iterate over can be specified by the `yielder` block parameter
# for example:
# test_enum = Enumerator.new do |yielder|
#   yielder << "a"
#   yielder << "b"
#   yielder << "c"
# end
# This adds the string elements "a", "b", "c" into the test_enum object
# Each of those elements can be accessed by calling Enumerator#next method.
#
# We can use this behaviour to specify that for our Enumerator object, each element that is iterated over is a factorial

factorial_enum = Enumerator.new do |yielder|
  num = 0
  accum = 1
  loop do
    accum = if num.zero?
              1
            else
              accum * num
            end
    yielder << accum
    num += 1
  end
end

# because the requirement was to create an enumerator that can iterate over an infinite number of factorials, we don't need to break the loop here.
# the number of iteratations will be specified at method invocation

# External iterators:
# print first 7 factorial values starting at 0:

0.upto(6) { puts factorial_enum.next }

# print three more factorial values

0.upto(2) { puts factorial_enum.next } 

# the default behaviour of Enumerator objects is to pause at the position last yielded, not start from the beginning of the elements. This has to be specified by the Enumerator#rewind method

factorial_enum.rewind
puts "Enumerator has been rewinded to the start of the sequence..."

0.upto(6) { puts factorial_enum.next }
