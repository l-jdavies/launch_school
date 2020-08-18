# Given this code:

items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

# Fill out the following method calls for gather so that they produce the corresponding output shown in numbers 1-4 listed below:

gather(items) do |*group, last|
  puts group.join(', ')
  puts last
end

# Let's start gathering food.
# apples, corn, cabbage
# wheat
# We've finished gathering!

#####################################

gather(items) do |first, *middle, last|
  puts first
  puts middle.join(', ')
  puts last
end

# Let's start gathering food.
# apples
# corn, cabbage
# wheat
# We've finished gathering!

####################################

gather(items) do |first, *remaining|
  puts first
  puts remaining.join(', ')
end

# Let's start gathering food.
# apples
# corn, cabbage, wheat
# We've finished gathering!

#####################################

gather(items) do | first, second, third, last|
  puts "#{first}, #{second}, #{third} and #{last}"
end

# Let's start gathering food.
# apples, corn, cabbage, and wheat
# We've finished gathering!
