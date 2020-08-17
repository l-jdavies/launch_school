# The Range#step method lets you iterate over a range of values where each value in the iteration is the previous value plus a "step" value. It returns the original range.

# Write a method that does the same thing as Range#step, but does not operate on a range. Instead, your method should take 3 arguments: the starting value, the ending value, and the step value to be applied to each iteration. Your method should also take a block to which it will yield (or call) successive iteration values.

# What do you think would be a good return value for this method, and why?

def step(in1, in2, in3)
  counter = in1
  end_val = in2
  step = in3

  until counter > end_val
    yield(counter)
    counter += step
  end

  [in1, in2, in3]
end

step(1, 10, 3) { |value| puts "value = #{value}" }

# Method should return input integers (I've returned them in an array) to mirror the behaviour of Range#step method
