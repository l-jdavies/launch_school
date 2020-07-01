# Using the following code, create a class named Cat that prints a greeting when #greet is invoked. The greeting should include the name and color of the cat. Use a constant to define the color.

class Cat
  attr_reader :name

  COLOUR = "purple"

  def initialize(name)
    @name = name
  end

  def greet
    puts "Hello! My name is #{name} and I am a #{COLOUR} cat!"
  end
end
