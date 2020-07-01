def calculate_factors(num)
  divisor = num
  factors = []

  while divisor > 0
    factors << (num / divisor) if num % divisor == 0
    divisor -= 1
  end
  factors
end
