# Practice problems: Medium 1

**Q1. Ben asked Alyssa to code review the following code:**

```ruby
class BankAccount
  attr_reader :balance

  def initialize(starting_balance)
    @balance = starting_balance
  end

  def positive_balance?
    balance >= 0
  end
end
```

**Alyssa glanced over the code quickly and said - "It looks fine, except that you forgot to put the `@` before `balance` when you refer to the balance instance variable in the body of the `positive_balance?` method."**

**"Not so fast", Ben replied. "What I'm doing here is valid - I'm not missing an `@`!"**

**Who is right, Ben or Alyssa, and why?**

- Answer:

    Ben. The `positive_balance?` method can access the getter method for `balance`  because access to the getter method has been provided through `attr_reader :balance` .

**Q2. Alan created the following code to keep track of items for a shopping cart application he's writing:**

```ruby
class InvoiceEntry
  attr_reader :quantity, :product_name

  def initialize(product_name, number_purchased)
    @quantity = number_purchased
    @product_name = product_name
  end

  def update_quantity(updated_count)
    # prevent negative quantities from being set
    quantity = updated_count if updated_count >= 0
  end
end
```

**Alyssa looked at the code and spotted a mistake. "This will fail when `update_quantity` is called", she says. Can you spot the mistake and how to address it?**

- Answer:

    The `update_quantity` method can't re-assign the `@quantity` instance variable because `attr_reader` only provides access to the getter methods, not setter. To fix the issue, Alan could change `attr_reader` to `attr_accessor` then reference `self.quantity`. Or explicitly re-assign the `quantity` instance variable by specifying `@quantity =` .

**Q3. In the last question Alan showed Alyssa this code which keeps track of items for a shopping cart application:**

```ruby
class InvoiceEntry
  attr_reader :quantity, :product_name

  def initialize(product_name, number_purchased)
    @quantity = number_purchased
    @product_name = product_name
  end

  def update_quantity(updated_count)
    quantity = updated_count if updated_count >= 0
  end
end
```

**Alyssa noticed that this will fail when `update_quantity` is called. Since `quantity` is an instance variable, it must be accessed with the `@quantity` notation when setting it. One way to fix this is to change `attr_reader` to `attr_accessor` and change quantity to `self.quantity`. Is there anything wrong with fixing it this way?**

- Answer:

    It will make the getter and setter methods for `quantity` public so `quantity` could be changed by calling `object.quantity = -1` , which removes the guard clause put in place by the `update_quantity` method.

**Q4. Create a class called `Greeting` with a single instance method called `greet` that takes a string argument and prints that argument to the terminal.**

**Now create two other classes that are derived from `Greeting`: one called `Hello` and one called `Goodbye`. The `Hello` class should have a `hi` method that takes no arguments and prints `"Hello"`. The `Goodbye` class should have a `bye` method to say `"Goodbye"`. Make use of the `Greeting` class `greet` method when implementing the `Hello` and `Goodbye` classes - do not use any puts in the `Hello` or `Goodbye` classes.**

- Answer:

    ```ruby
    class Greeting
    	def greet(greeting)
    		puts greeting
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

**Q5. You are given the following class that has been implemented:**

```ruby
class KrispyKreme
  def initialize(filling_type, glazing)
    @filling_type = filling_type
    @glazing = glazing
  end
end
```

**And the following specification of expected behavior:**

```ruby
donut1 = KrispyKreme.new(nil, nil)
donut2 = KrispyKreme.new("Vanilla", nil)
donut3 = KrispyKreme.new(nil, "sugar")
donut4 = KrispyKreme.new(nil, "chocolate sprinkles")
donut5 = KrispyKreme.new("Custard", "icing")

puts donut1
  => "Plain"

puts donut2
  => "Vanilla"

puts donut3
  => "Plain with sugar"

puts donut4
  => "Plain with chocolate sprinkles"

puts donut5
  => "Custard with icing"
```

**Write additional code for KrispyKreme such that the puts statements will work as specified above.**

- Answer:

    ```ruby
    def to_s
    	filling = @filling_type.nil? ? "Plain" : @filling_type
    	glaze = @glazing.nil? ? "" : " with #{@glazing}"
    	filling + glaze
    end
    ```

**Q6. If we have these two methods:**

```ruby
class Computer
  attr_accessor :template

  def create_template
    @template = "template 14231"
  end

  def show_template
    template
  end
end
```

**and**

```ruby
class Computer
  attr_accessor :template

  def create_template
    self.template = "template 14231"
  end

  def show_template
    self.template
  end
end
```

**What is the difference in the way the code works?**

- Answer:

    Both sets of code will achieve the same thing but in the second set of code there's an unnecessary use of `self` in the `show_template` method. Currently the method is using the setter method for `template` but isn't re-assigning the instance variable. You could just use `template` to access the getter method.

**Q7. How could you change the method name below so that the method name is more clear and less repetitive?**

```ruby
class Light
  attr_accessor :brightness, :color

  def initialize(brightness, color)
    @brightness = brightness
    @color = color
  end

  def self.light_information
    "I want to turn on the light with a brightness level of super high and a colour of green"
  end

end
```

- Answer:

    Change is to `self.information` . It's not good practice to include the class name in a class method.