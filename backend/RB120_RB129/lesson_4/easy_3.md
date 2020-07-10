# Practice problems: Easy 3

Q1. If we have this code:

```ruby
class Greeting
  def greet(message)
    puts message
  end
end

class Hello < Greeting
  def hi
    greet("Hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end
```

What happens in each of the following cases:

case 1:

```ruby
hello = Hello.new
hello.hi
```

- Answer:

    Output `"Hello"`

case 2:

```ruby
hello = Hello.new
hello.bye
```

- Answer:

    An `undefined method` error will be raised. Objects in the `Hello` class can't access instance methods in the `Goodbye` class.

case 3:

```ruby
hello = Hello.new
hello.greet
```

- Answer:

    An error message will be raised that the method was expecting 1 argument but it was provided with 0. 

case 4:

```ruby
hello = Hello.new
hello.greet("Goodbye")
```

- Answer:

    Output `"Goodbye"` by accessing the `Greeting#greet` method.

case 5:

```ruby
Hello.hi
```

- Answer:

    `undefined method` error. `hi` is an instance method, so needs to be called on an instance of the `Hello` class, not on the class directly.

**Q2. In the last question we had the following classes:**

```ruby
class Greeting
  def greet(message)
    puts message
  end
end

class Hello < Greeting
  def hi
    greet("Hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end
```

**If we call `Hello.hi` we get an error message. How would you fix this?**

- Answer:

    You can either instantiate a `Hello` class object and call the `hi` instance method on that i.e:

    ```ruby
    bob = Hello.new
    bob.hi
    ```

    Or you can make the `hi` instance method a class method. You also have to account for calling the `Greeting#greet` instance method:

    ```ruby
    def self.hi
    	greeting = Greet.new
    	greeting.greet("hello")
    end

    Hello.hi # => hello
    ```

**Q3. When objects are created they are a separate realization of a particular class. Given the class below, how do we create two different instances of this class, both with separate names and ages?**

```ruby
class AngryCat
  def initialize(age, name)
    @age  = age
    @name = name
  end

  def age
    puts @age
  end

  def name
    puts @name
  end

  def hiss
    puts "Hisssss!!!"
  end
end
```

- Answer:

    ```ruby
    jasper = AngryCat.new(2, "jasper")
    evie = AngryCat.new(3, 'evie')
    ```

**Q4. Given the class below, if we created a new instance of the class and then called `to_s` on that instance we would get something like `"#[Cat:0x007ff39b356d30](cat:0x007ff39b356d30)"`**

```ruby
class Cat
  def initialize(type)
    @type = type
  end
end
```

**How could we go about changing the `to_s` output on this method to look like this: `I am a tabby cat` ? (this is assuming that `"tabby"` is the type we passed in during initialization).**

- Answer:

    ```ruby
    attr_reader :type

    def to_s
    	"I am a #{type} cat"
    end
    ```

**Q5. If I have the following class:**

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

**What would happen if I called the methods like shown below?**

```ruby
tv = Television.new
tv.manufacturer
tv.model

Television.manufacturer
Television.model
```

- Answer:

    `tv.manufacturer` would return an error because `manufacturer` is a class method and should be called directly on the `Television` class not `Television` class objects. 

    `tv.model` would work, `model` is an instance method.

    `Television.manufacturer` would work but `Television.model` would not.

**Q6. If we have a class such as the one below:**

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

**In the make_one_year_older method we have used self. What is another way we could write this method so we don't have to use the self prefix?**

- Answer:

    `@age += 1` . `self` is used to access the `age` setter method. 

**Q7. What is used in this class but doesn't add any value?**

```ruby
class Light
  attr_accessor :brightness, :color

  def initialize(brightness, color)
    @brightness = brightness
    @color = color
  end

  def self.information
    return "I want to turn on the light with a brightness level of super high and a color of green"
  end

end
```

- Answer:

    Both of the instance variables.

    Correct answer was `return` - it doesn't need to be explicitly stated.