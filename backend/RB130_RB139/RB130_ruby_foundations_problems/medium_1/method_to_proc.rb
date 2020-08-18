# Using this information, together with the course page linked above, fill in the missing part of the following code so we can convert an array of integers to base 8 (octal numbers). Use the comments for help in determining where to make your modifications, and make sure to review the "Approach/Algorithm" section for this exercise; it should prove useful.

def convert_to_base_8(n)
  n.to_s(8).to_i
end

# The correct type of argument must be used below
base8_proc = method(:convert_to_base_8).to_proc

# We'll need a Proc object to make this code work. Replace `a_proc`
# with the correct object
puts [8, 10, 12, 14, 16, 33].map(&:to_s) #== [10, 12, 14, 16, 20, 41]
