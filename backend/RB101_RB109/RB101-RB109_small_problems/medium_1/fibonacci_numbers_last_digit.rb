# In this exercise, you are going to compute a method that returns the last digit of the nth Fibonacci number.


def fibonacci_last(num)
  return 1 if num == 1

  fibo_arr = [1, 1]

  until fibo_arr.size == num
    f = fibo_arr[-1] + fibo_arr[-2]
    fibo_arr << f
  end
  fibo_arr.pop.to_s.chars.pop.to_i
end


