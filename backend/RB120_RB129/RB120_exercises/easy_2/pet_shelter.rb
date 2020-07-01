=begin
Write the classes and methods that will be necessary to make this code run, and print the following output:

P Hanson has adopted the following pets:
a cat named Butterscotch
a cat named Pudding
a bearded dragon named Darwin

B Holmes has adopted the following pets:
a dog named Molly
a parakeet named Sweetie Pie
a dog named Kennedy
a fish named Chester

P Hanson has 3 adopted pets.
B Holmes has 4 adopted pets.

The order of the output does not matter, so long as all of the information is presented.
=end

class Pet
  attr_reader :animal_type, :animal_name

  def initialize(animal_type, animal_name)
    @animal_type = animal_type
    @animal_name = animal_name
  end
end

class Owner
  attr_accessor :pets
  attr_reader :name

  def initialize(name)
    @name = name
    @pets = []
  end

  def print_pets
    @pets.each do |pet|
      puts "a #{pet.animal_type} named #{pet.animal_name}"
    end
  end

  def number_of_pets
    @pets.size
  end
end

class Shelter
  attr_reader :adopted_animals

  def initialize
    @pet_owners = []
  end

  def adopt(owner, pet)
    @pet_owners << owner unless @pet_owners.include?(owner)
    owner.pets << pet
  end

  def print_adoptions
    @pet_owners.each do |person|
      puts "#{person.name} has adopted the following pets:"
      person.print_pets
      puts 
    end
  end
end
