# Practice problems: Easy 1

**Q1. Which of the following are objects in Ruby? If they are objects, how can you find out what class they belong to?**

```ruby
true
"hello"
[1, 2, 3, "happy days"]
142
```

- Answer:

    They are all objects. You can identify the class by calling the `class` method on the object.



**Q2. If we have a `Car` class and a `Truck` class and we want to be able to `go_fast`, how can we add the ability for them to go_fast using the module `Speed`? How can you check if your `Car` or `Truck` can now go fast?**

```ruby
module Speed
  def go_fast
    puts "I am a #{self.class} and going super fast!"
  end
end

class Car
  def go_slow
    puts "I am safe and driving slow."
  end
end

class Truck
  def go_very_slow
    puts "I am a heavy truck and like going very slow."
  end
end
```

- Answer:

    ```ruby
    module Speed
      def go_fast
        puts "I am a #{self.class} and going super fast!"
      end
    end

    class Car
    	include Speed

      def go_slow
        puts "I am safe and driving slow."
      end
    end

    class Truck
    	include Speed

      def go_very_slow
        puts "I am a heavy truck and like going very slow."
      end
    end

    car = Car.new
    truck = Truck.new
    car.go_fast
    truck.go_fast
    ```



**Q3. In the last question we had a module called `Speed` which contained a `go_fast` method. We included this module in the `Car` class as shown below.**

```ruby
module Speed
  def go_fast
    puts "I am a #{self.class} and going super fast!"
  end
end

class Car
  include Speed
  def go_slow
    puts "I am safe and driving slow."
  end
end
```

When we called the `go_fast` method from an instance of the `Car` class (as shown below) you might have noticed that the string printed when we go fast includes the name of the type of vehicle we are using. How is this done?

- Answer:

    By calling `self.class` in the `go_fast` method. This returns the class of the object `go_fast` was called on.



**Q4. If we have a class AngryCat how do we create a new instance of this class?**

- Answer:

    ```ruby
    cat = AngryCat.new
    ```



**Q5. Which of these two classes has an instance variable and how do you know?**

```ruby
class Fruit
  def initialize(name)
    name = name
  end
end

class Pizza
  def initialize(name)
    @name = name
  end
end
```

- Answer

    `Pizza` because `@name` is an instance variable, as indicated by `@` whereas `name` is a local variable.

    Note, you can use the `instance_variable` methods to return an array of instance variables associated with an object.



**Q6. What could we add to the class below to access the instance variable `@volume`?**

```ruby
class Cube
  def initialize(volume)
    @volume = volume
  end
end
```

- Answer

    `attr_reader`



**Q7. What is the default return value of `to_s` when invoked on an object? Where could you go to find out if you want to be sure?**

- Answer

    Returns the object's class and encoding of the object ID. Could check the Ruby documentation for `to_s` if wasn't sure.



**Q8. If we have a class such as the one below:**

```ruby
class Cat
  attr_accessor :type, :age

  def initialize(type)
    @type = type
    @age  = 0
  end

  def make_one_year_older
    self.age += 1
  end
end
```

You can see in the `make_one_year_older` method we have used `self`. What does `self` refer to here?

- Answer

    The calling object.



**Q9. If we have a class such as the one below:**

```ruby
 class Cat
  @@cats_count = 0

  def initialize(type)
    @type = type
    @age  = 0
    @@cats_count += 1
  end

  def self.cats_count
    @@cats_count
  end
end
```

In the name of the `cats_count` method we have used `self`. What does `self` refer to in this context?

- Answer

    It refers to the class. `self.cats_count` is a class method.



**Q10.  If we have the class below, what would you need to call to create a new instance of this class.**

```ruby
class Bag
  def initialize(color, material)
    @color = color
    @material = material
  end
end
```

- Answer

    ```ruby
    hand_bag = Bag.new("Red", "plastic")
    ```
