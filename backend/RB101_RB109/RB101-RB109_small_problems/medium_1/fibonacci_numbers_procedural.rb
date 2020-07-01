# Rewrite your recursive fibonacci method so that it computes its results without recursion.

# By answering the previous question incorrectly, I have already completed this one!


def fibonacci(num)
  return 1 if num == 1

  fibo_arr = [1, 1]

  until fibo_arr.size == num
    f = fibo_arr[-1] + fibo_arr[-2]
    fibo_arr << f
  end
  fibo_arr.pop
end


