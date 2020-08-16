# Write a method that returns a list of all of the divisors of the positive integer passed in as an argument. The return value can be in any sequence you wish.


def divisors(num)
  div_arr = []
  
  for el in 1..num
    if num % el == 0
      div_arr << el
    else
      next
    end
  end

  div_arr
end

puts divisors(1) == [1]
puts divisors(7) == [1, 7]
puts divisors(12) == [1, 2, 3, 4, 6, 12]
puts divisors(98) == [1, 2, 7, 14, 49, 98]
puts divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute

# LS solution uses select - that would be a more elegant solution
