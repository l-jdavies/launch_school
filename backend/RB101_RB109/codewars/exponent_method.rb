# Create a method called "power" that takes two integers and returns the value of the first argument raised to the power of the second
# Return nil if the second argument is negative.

def power(base, exponent)
  return nil if exponent < 0

  return 1 if exponent == 0

  value = base

  (exponent - 1).times do value *= base end

  value
end
