# Practice problems: Easy 2

**Q1. You are given the following code:**

```ruby
class Oracle
  def predict_the_future
    "You will " + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end
```

**What is the result of executing the following code:**

```ruby
oracle = Oracle.new
oracle.predict_the_future
```

- Answer:

    The code should execute correctly with `"You will"` plus one of the string elements from the `choices` method array. That is because calling the `choices` method will return an array of strings and the `sample` method has been chained onto that return value.

**Q2. We have an `Oracle` class and a `RoadTrip` class that inherits from the `Oracle` class.**

```ruby
class Oracle
  def predict_the_future
    "You will " + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end

class RoadTrip < Oracle
  def choices
    ["visit Vegas", "fly to Fiji", "romp in Rome"]
  end
end
```

**What is the result of the following:**

```ruby
trip = RoadTrip.new
trip.predict_the_future
```

- Answer

    I thought the `choices` method would call the `Oracle#choices` because `predict_the_future` is an `Oracle` instance method. However, that's incorrect.

    Every time Ruby tries to resolve a method name, it looks in the calling object's class first. If it can't find the method there, then it moves up the method lookup chain. 

**Q3. How do you find where Ruby will look for a method when that method is called? How can you find an object's ancestors?**

```ruby
module Taste
  def flavor(flavor)
    puts "#{flavor}"
  end
end

class Orange
  include Taste
end

class HotSauce
  include Taste
end
```

**What is the lookup chain for `Orange` and `HotSauce`?**

- Answer

    By calling the `ancestors` method.

    `Orange.ancestors`

**Q4.  What could you add to this class to simplify it and remove two methods from the class definition while still maintaining the same functionality?**

```ruby
class BeesWax
  def initialize(type)
    @type = type
  end

  def type
    @type
  end

  def type=(t)
    @type = t
  end

  def describe_type
    puts "I am a #{@type} of Bees Wax"
  end
end
```

- Answer:

    Remove the `type` and `type=(t)` methods and replace with `attr_accessor :type` instead.

**Q5.  There are a number of variables listed below. What are the different types and how do you know which is which?**

```ruby
excited_dog = "excited dog"
@excited_dog = "excited dog"
@@excited_dog = "excited dog"
```

- Answer:

    ```ruby
    excited_dog = "excited dog" # local variable
    @excited_dog = "excited dog" # instance variable
    @@excited_dog = "excited dog" # class variable
    ```

**Q6.  If I have the following class:**

```ruby
class Television
  def self.manufacturer
    # method logic
  end

  def model
    # method logic
  end
end
```

**Which one of these is a class method (if any) and how do you know? How would you call a class method?**

- Answer:

    `self.manufacturer` is a class method because `self` is called in the method definition. The method is called by `Television.manufacturer`.

**Q7. If we have a class such as the one below:**

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

**Explain what the `@@cats_count` variable does and how it works. What code would you need to write to test your theory?**

- Answer:

    Each time a `Cat` object is instantiated, the `@@cats_count` class variable is incremented by 1. The `self.cats_count` class method returns the `@@cats_count` class variable. Therefore you can determine the total number of `Cat` objects that have been instantiated by calling `Cat.cats_count` .

**Q8. If we have this class:**

```ruby
class Game
  def play
    "Start the game!"
  end
end
```

**And another class:**

```ruby
class Bingo
  def rules_of_play
    #rules of play
  end
end
```

**What can we add to the `Bingo` class to allow it to inherit the `play` method from the `Game` class?**

- Answer:

    ```ruby
    class Bingo < Game
    ```

**Q9. If we have this class:**

```ruby
class Game
  def play
    "Start the game!"
  end
end

class Bingo < Game
  def rules_of_play
    #rules of play
  end
end
```

**What would happen if we added a `play` method to the `Bingo` class, keeping in mind that there is already a method of this name in the `Game` class that the `Bingo` class inherits from.**

- Answer:

    The `Bingo#play` method would override the `Game#play` method for `Bingo` class objects.

**Q10. What are the benefits of using Object Oriented Programming in Ruby? Think of as many as you can.**

- Answer:
    1. Creating objects allows programmers to think more abstractly about the code they are writing.
    2. Objects are represented by nouns so are easier to conceptualize.
    3. It allows us to only expose functionality to the parts of code that need it, meaning namespace issues are much harder to come across.
    4. It allows us to easily give functionality to different parts of an application without duplication.
    5. We can build applications faster as we can reuse pre-written code.
    6. As the software becomes more complex this complexity can be more easily managed.