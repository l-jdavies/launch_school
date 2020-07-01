# Write a recursive method that computes the nth Fibonacci number, where nth is an argument to the method.
#
# INPUT
# integer
#
# OUTPUT
# integer
# nth number in a sequence of Fibonacci numbers
#
# RULES
# calculate Fibonacci numbers until the number of integers generated equals the input integer
#
# ALGORITHM
# calculate Fibonacci sequence
# add each sequence to an array
# when the size of the array equals the input number
# return the last element of the input array


def fibonacci(num)
  return 1 if num == 1

  fibo_arr = [1, 1]

  until fibo_arr.size == num
    f = fibo_arr[-1] + fibo_arr[-2]
    fibo_arr << f
  end
  fibo_arr.pop
end

# although my solution returns the correct values
# it's not recursion because it doesn't call itself
# I'll use the LS solution for the next parts of the problem
