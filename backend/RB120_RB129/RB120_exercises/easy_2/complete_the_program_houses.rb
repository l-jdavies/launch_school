# Modify the House class so that the above program will work. You are permitted to define only one new method in House.

class House
  attr_reader :price

  def compare_house_price(other_house)
    if price < other_house.price
      puts "Home 1 is cheaper"
    elsif other_house.price > price
      puts "Home 2 is more expensive"
    end
  end

  def initialize(price)
    @price = price
  end
end

home1 = House.new(100_000)
home2 = House.new(150_000)
home1.compare_house_price(home2)
