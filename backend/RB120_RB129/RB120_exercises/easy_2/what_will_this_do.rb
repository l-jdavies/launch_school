# What will the following code print?

class Something
  def initialize
    @data = 'Hello'
  end

  def dupdata
    @data + @data
  end

  def self.dupdata
    'ByeBye'
  end
end

thing = Something.new
puts Something.dupdata #=> 'ByeBye' because it's calling the class method dupdata
puts thing.dupdata #=> 'HelloHello' because it's calling the instance method dupdata
