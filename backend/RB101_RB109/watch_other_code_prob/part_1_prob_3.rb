# Write a method that will take an array of numbers and return the number of primes in the array.

def is_prime?(num)
  return false if num < 2
  for i in 2..(num -1)
    if num % i == 0
      return false
    end
  end
  true
end

def select_primes(arr)
  arr_primes = arr.select do |number|
    is_prime?(number)
  end
end

def count_primes(arr)
  select_primes(arr).length
end
