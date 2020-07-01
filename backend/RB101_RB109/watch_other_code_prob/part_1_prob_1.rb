# Write a method that will determine whether an integer is a prime. Do not use the Prime class.

def is_prime?(num)
  return false if num < 2

  for i in 2..(num - 1)
    return false if num % i == 0
  end
  true
end
