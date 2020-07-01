# Inheritance

Class based inheritance works great when it's used to model hierarchical domains. Let's take a look at a few practice problems. Suppose we're building a software system for a pet hotel business, so our classes deal with pets.

1. Given this class:
```ruby
class Dog
  def speak
    'bark!'
  end

  def swim
    'swimming!'
  end
end

teddy = Dog.new
puts teddy.speak           # => "bark!"
puts teddy.swim   
```
One problem is that we need to keep track of different breeds of dogs, since they have slightly different behaviors. For example, bulldogs can't swim, but all other dogs can.

Create a sub-class from Dog called Bulldog overriding the swim method to return "can't swim!"

```ruby
class Dog
  def speak
    'bark!'
  end

  def swim
    'swimming!'
  end
end

class BullDog < Dog
  def swim
    "Can't swim!"
  end
end

buffy = BullDog.new
buffy.swim
```

2. Let's create a few more methods for our Dog class.
```ruby
class Dog
  def speak
    'bark!'
  end

  def swim
    'swimming!'
  end

  def run
    'running!'
  end

  def jump
    'jumping!'
  end

  def fetch
    'fetching!'
  end
end
```

Create a new class called Cat, which can do everything a dog can, except swim or fetch. Assume the methods do the exact same thing. Hint: don't just copy and paste all methods in Dog into Cat; try to come up with some class hierarchy.

```ruby
class AnimalBehaviour
   def run
    'running!'
  end

  def jump
    'jumping!'
  end
end

class Dog < AnimalBehaviour
  def speak
    'bark'
  end

  def swim
    'swimming!'
  end

	def fetch
    'fetching!'
  end
end 

class Cat < AnimalBehaviour
  def speak
    'meow'
  end
end
```

3. Draw a class hierarchy diagram of the classes from step #2

                AnimalBehaviour
                |             |
                |             |
                |             |
               Dog           Cat

4. What is the method lookup path and how is it important?
It is accessed by calling the `ancestors` method and it shows the order in which classes Ruby searches for a method. It's important because if you have a method with the same name in different classes within the lookup path, you need to know which of the methods will be called first.
