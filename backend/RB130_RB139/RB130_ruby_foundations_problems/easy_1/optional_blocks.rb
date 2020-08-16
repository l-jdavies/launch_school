# Write a method that takes an optional block. If the block is specified, the method should execute it, and return the value returned by the block. If no block is specified, the method should simply return the String 'Does not compute.'.

def compute
  if block_given?
    return_val = yield
  else
    return "Does not compute."
  end

  return_val
end

puts compute { 5 + 3  } == 8
puts compute { 'a' + 'b'  } == 'ab'
puts compute == 'Does not compute.'
