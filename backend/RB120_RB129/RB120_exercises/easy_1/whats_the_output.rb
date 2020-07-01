# Take a look at the following code:
# What output does this code print? Fix this class so that there are no surprises waiting in store for the unsuspecting developer.

# Original code mutated the @name instance variable. In this example @name references the local variable name, which means the instance variable @name and local variable (outside of the Pet class) both reference the same object. Therefore when @name is mutated, the local variable name is also mutated, outside of the class. 

class Pet
  attr_reader :name

  def initialize(name)
    @name = name.to_s
  end

  def to_s
    "My name is #{@name.upcase}."
  end
end

name = 'Fluffy'
fluffy = Pet.new(name)
puts fluffy.name
puts fluffy
puts fluffy.name
puts name
