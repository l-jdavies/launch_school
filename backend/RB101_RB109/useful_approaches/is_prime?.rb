def is_prime?(num)
  return false if num < 2

  (2..num - 1).each do |multiplier|
    return false if num % multiplier == 0
  end
  true
end
