# Now that we have a Walkable module, we are given a new challenge. Apparently some of our users are nobility, and the regular way of walking simply isn't good enough. Nobility need to strut.
#
# We need a new class Noble that shows the title and name when walk is called
# byron = Noble.new("Byron", "Lord")
# p byron.walk
# # => "Lord Byron struts forward"
#
# We must have access to both name and title because they are needed for other purposes that we aren't showing here.


module Moveable
  def walk
    puts "#{self} #{self.gait} forward"
  end
end

class Noble
  include Moveable

  attr_reader :name, :title

  def initialize(name, title)
    @name = name
    @title = title
  end

  def gait
    "struts"
  end

  def to_s
    "#{name} #{title}"
  end
end

class Person
  include Moveable
  attr_reader :name

  def initialize(name)
    @name = name
  end
  
  def to_s
    name
  end
  
  private

  def gait
    "strolls"
  end
end

class Cat
  include Moveable

  attr_reader :name

  def initialize(name)
    @name = name
  end

  def to_s
    name
  end

  private

  def gait
    "saunters"
  end
end

class Cheetah
  include Moveable
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def to_s
    name
  end

  private

  def gait
    "runs"
  end
end

