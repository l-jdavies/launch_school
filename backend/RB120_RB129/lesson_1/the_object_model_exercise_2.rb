# What is a module? What is its purpose? How do we use them with our classes?
# Create a module for the class you created in exercise 1 and include it properly.

module Tricks
  def high_five
    puts "Up top!"
  end
end

class GoodDog
  include Tricks
end

# A module is a set of behaviours that you want to be accessable to multiple classes. This is achieved via mixins.

