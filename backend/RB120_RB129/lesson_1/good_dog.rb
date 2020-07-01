class GoodDog
  def initialize(name) #constructor
    @name = name
  end

  def name #re-named from 'get_name' #getter
    @name
  end

  def name=(n) #re-named from 'set_name=' #setter
    @name = n
  end

  def speak
    "#{@name} says Arf!"
  end
end

sparky = GoodDog.new("Sparky")
puts sparky.speak
puts sparky.get_name
sparky.set_name = 'Spartacus'
puts sparky.get_name

fido = GoodDog.new('Fido')
puts fido.speak

