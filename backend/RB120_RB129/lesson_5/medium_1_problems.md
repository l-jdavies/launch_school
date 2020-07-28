# Medium 1 problems

1. **Privacy**

Consider the following class:

```ruby
class Machine
  attr_writer :switch

  def start
    self.flip_switch(:on)
  end

  def stop
    self.flip_switch(:off)
  end

  def flip_switch(desired_state)
    self.switch = desired_state
  end
end
```

Modify this class so both `flip_switch` and the setter method `switch=` are private methods.

```ruby
class Machine
  def start
    flip_switch(:on)
  end

  def stop
    flip_switch(:off)
  end

  private

  def flip_switch(desired_state)
    self.switch = desired_state
  end

  attr_writer :switch
end
```

**2. Fixed array**

A fixed-length array is an array that always has a fixed number of elements. Write a class that implements a fixed-length array, and provides the necessary methods to support the following code:

```ruby
fixed_array = FixedArray.new(5)
puts fixed_array[3] == nil
puts fixed_array.to_a == [nil] * 5

fixed_array[3] = 'a'
puts fixed_array[3] == 'a'
puts fixed_array.to_a == [nil, nil, nil, 'a', nil]

fixed_array[1] = 'b'
puts fixed_array[1] == 'b'
puts fixed_array.to_a == [nil, 'b', nil, 'a', nil]

fixed_array[1] = 'c'
puts fixed_array[1] == 'c'
puts fixed_array.to_a == [nil, 'c', nil, 'a', nil]

fixed_array[4] = 'd'
puts fixed_array[4] == 'd'
puts fixed_array.to_a == [nil, 'c', nil, 'a', 'd']
puts fixed_array.to_s == '[nil, "c", nil, "a", "d"]'

puts fixed_array[-1] == 'd'
puts fixed_array[-4] == 'c'

begin
  fixed_array[6]
  puts false
rescue IndexError
  puts true
end

begin
  fixed_array[-7] = 3
  puts false
rescue IndexError
  puts true
end

begin
  fixed_array[7] = 3
  puts false
rescue IndexError
  puts true
end
```

```ruby
class FixedArray
  attr_accessor :array

  def initialize(number_elements, element=nil)
    @array = Array.new(number_elements)
  end

  def []=(idx, obj)
    array[idx] = obj if idx <= @array.size
  end

  def [](idx)
    array[idx]
  end

  def to_a
    array
  end

  def to_s
    array.to_s
  end
end
```

I'm missing some details from the LS solution. Currently my code doesn't raise an error if the user attempts to assign an element outside of the index range. LS solution handles this by using:

```ruby
def [](idx)
  @array.fetch(index)
end
```

The `fetch` method will raise an exception if you try and access an element outside of the index range. This is then utilized in the `FixedArray#[]=` method:

```ruby
def []=(idx, obj)
  self[idx] # will raise an exception if out of range
  @array[idx] = obj
end
```

The LS solution also implemented the `FixedArray#to_a` method to return a clone of the `@array` instance variable to prevent any unforeseen changes to `@array` 

```ruby
class FixedArray
  def initialize(max_size)
    @array = Array.new(max_size)
  end

  def [](index)
    @array.fetch(index)
  end

  def []=(index, value)
    self[index]             # raise error if index is invalid!
    @array[index] = value
  end

  def to_a
    @array.clone
  end

  def to_s
    to_a.to_s
  end
end
```

**3. Students**

Below we have 3 classes: `Student`, `Graduate`, and `Undergraduate`. The implementation details for the `#initialize` methods in `Graduate` and `Undergraduate` are missing. Fill in those missing details so that the following requirements are fulfilled:

1 . Graduate students have the option to use on-campus parking, while Undergraduate students do not.

2. Graduate and Undergraduate students both have a name and year associated with them.

Note, you can do this by adding or altering no more than 5 lines of code.

```ruby
class Student
  def initialize(name, year)
    @name = name
    @year = year
  end
end

class Graduate < Student
  def initialize(name, year, parking)
    super(name, year)
    @parking = parking
  end
end

class Undergraduate < Student
  def initialize(name, year)
    super
  end
end
```

**4. Circular Queue**

A [circular queue](https://en.wikipedia.org/wiki/Circular_buffer) is a collection of objects stored in a buffer that is treated as though it is connected end-to-end in a circle. When an object is added to this circular queue, it is added to the position that immediately follows the most recently added object, while removing an object always removes the object that has been in the queue the longest.

This works as long as there are empty spots in the buffer. If the buffer becomes full, adding a new object to the queue requires getting rid of an existing object; with a circular queue, the object that has been in the queue the longest is discarded and replaced by the new object.

Assuming we have a circular queue with room for 3 objects, the circular queue looks and acts like this:

![Medium%201%20problems%209cf1528dd9574324b84d53f96f90b35a/Untitled.png](Medium%201%20problems%209cf1528dd9574324b84d53f96f90b35a/Untitled.png)

Your task is to write a CircularQueue class that implements a circular queue for arbitrary objects. The class should obtain the buffer size with an argument provided to `CircularQueue::new`, and should provide the following methods:

- `enqueue` to add an object to the queue
- `dequeue` to remove (and return) the oldest object in the queue. It should return `nil` if the queue is empty.

You may assume that none of the values stored in the queue are `nil` (however, `nil` may be used to designate empty spots in the buffer).

Examples:

```ruby
queue = CircularQueue.new(3)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil

queue = CircularQueue.new(4)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 4
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil
```

The above code should display `true` 15 times.

For info on circular queues: [https://www.studytonight.com/data-structures/circular-queue](https://www.studytonight.com/data-structures/circular-queue)

General outline of how a circular queue works:

- Initialize two pointers, called `front` and `tail` that are used to keep track of the first and last elements in the queue.
- Both pointers are initialized with a value of `0`.
- When an element is enqueued, the element is added to the position pointed to by `tail` and `tail` is incremented by `1`.
- To dequeue an element, the element in the position pointed to by the `head` is returned and the `head` pointer is incremented by `1` .
- When the `head` or `tail` pointers reach the end of the queue, their values will be `0` again.
- The `head` and `tail` pointers can cross each other. This means the `head` pointer can have a greater value than the `tail` pointer. This can happen if several elements have been enqueued, resulting in `tail` reaching the end of the queue and thereby having a value of `0`. If several dequeues are performed, then the value of `head` will be incremented, resulting in `head` having a greater value than `tail` .
- When incrementing the `head` and `tail` pointers we need to ensure they re-set to `0` when the maximum size of the queue has been reached. To achieve this we use the `modulo` operator:

```ruby
head = 0
max_size = 4

head = (head + 1) % max_size
#=> head = 1 (1 % 4 = 1)

head = (head + 1) % max_size
#=> head = 2 (2 % 4 = 2)

head = (head + 1) % max_size
#=> head = 3 (3 % 4 = 3)

head = (head + 1) % max_size
#=> head = 0 (4 % 4 = 0) # head is re-set to 0
```

This ensures the `head` and `tail` pointers keep going around the circular queue.

```ruby
class CircularQueue
  attr_accessor :queue, :head, :tail

  def initialize(max)
    @head = 0
    @tail = 0
    @max = max
    @queue = Array.new(max)
  end

  def enqueue(element)
    if queue[tail].nil?
      queue[tail] = element
      self.tail = increment(tail)
    else
      queue[head] = element
      self.head = increment(head)
    end
  end

  def dequeue
    return nil if queue.all? { |e| e.nil? }
    return_value = queue[head]
    queue[head] = nil
    self.head = increment(head)
    return_value
  end

  private

  def increment(pointer)
    pointer = (pointer + 1) % @max
  end
end
```

**5. Stack machine interpretation**

You may remember our Minilang language from back in the RB101-RB109 Medium exercises. We return to that language now, but this time we'll be using OOP. If you need a refresher, refer back to [that exercise](https://launchschool.com/exercises/0f677535).

Write a class that implements a miniature stack-and-register-based programming language that has the following commands:

- `n` Place a value n in the "register". Do not modify the stack.
- `PUSH` Push the register value on to the stack. Leave the value in the register.
- `ADD` Pops a value from the stack and adds it to the register value, storing the result in the register.
- `SUB` Pops a value from the stack and subtracts it from the register value, storing the result in the register.
- `MULT` Pops a value from the stack and multiplies it by the register value, storing the result in the register.
- `DIV` Pops a value from the stack and divides it into the register value, storing the integer result in the register.
- `MOD` Pops a value from the stack and divides it into the register value, storing the integer remainder of the division in the register.
- `POP` Remove the topmost item from the stack and place in register
- `PRINT` Print the register value

All operations are integer operations (which is only important with DIV and MOD).

Programs will be supplied to your language method via a string passed in as an argument. Your program should produce an error if an unexpected item is present in the string, or if a required stack value is not on the stack when it should be (the stack is empty). In all error cases, no further processing should be performed on the program.

You should initialize the register to 0.

Examples:

```ruby
Minilang.new('PRINT').eval
# 0

Minilang.new('5 PUSH 3 MULT PRINT').eval
# 15

Minilang.new('5 PRINT PUSH 3 PRINT ADD PRINT').eval
# 5
# 3
# 8

Minilang.new('5 PUSH 10 PRINT POP PRINT').eval
# 10
# 5

Minilang.new('5 PUSH POP POP PRINT').eval
# Empty stack!

Minilang.new('3 PUSH PUSH 7 DIV MULT PRINT ').eval
# 6

Minilang.new('4 PUSH PUSH 7 MOD MULT PRINT ').eval
# 12

Minilang.new('-3 PUSH 5 XSUB PRINT').eval
# Invalid token: XSUB

Minilang.new('-3 PUSH 5 SUB PRINT').eval
# 8

Minilang.new('6 PUSH').eval
# (nothing printed; no PRINT commands)
```

For error handling, you will likely need exceptions. See the Ruby documentation for [handling exceptions](https://ruby-doc.org/core/doc/syntax/exceptions_rdoc.html) and for the [Exception class](https://ruby-doc.org/core/Exception.html). You may also find this blog article on [Getting Started With Ruby Exceptions](https://launchschool.com/blog/getting-started-with-ruby-exceptions) helpful.

Custom exceptions are usually derived from the `StandardError` exception class, like so:

```
class MyCustomError < StandardError; end

```

You may also find [Object#send](http://ruby-doc.org/core/Object.html#method-i-send) to be useful when evaluating the Minilang code.

**Hint:**

If you have a variable `str` that points to a string, and you want to determine if it is a number, you can use a regular expression in an `if` statement, like this:

```
if str =~ /\A[-+]?\d+\z/
  puts "It's a number!"
else
  puts "It's not a number."
end

```

Regular expressions (regex) are very useful for string operations, but we don't cover them in any detail until RB130. If you haven't already read our book, [Introduction to Regular Expressions](https://launchschool.com/books/regex), you may do so now, but it isn't necessary - this hint is all you need to know about regex for this problem.

- LS solution:

    ```ruby
    require 'set'

    class MinilangError < StandardError; end
    class BadTokenError < MinilangError; end
    class EmptyStackError < MinilangError; end

    class Minilang
      ACTIONS = Set.new %w(PUSH ADD SUB MULT DIV MOD POP PRINT)

      def initialize(program)
        @program = program
      end

      def eval
        @stack = []
        @register = 0
        @program.split.each { |token| eval_token(token) }
      rescue MinilangError => error
        puts error.message
      end

      private

      def eval_token(token)
        if ACTIONS.include?(token)
          send(token.downcase)
        elsif token =~ /\A[-+]?\d+\z/
          @register = token.to_i
        else
          raise BadTokenError, "Invalid token: #{token}"
        end
      end

      def push
        @stack.push(@register)
      end

      def pop
        raise EmptyStackError, "Empty stack!" if @stack.empty?
        @register = @stack.pop
      end

      def add
        @register += pop
      end

      def div
        @register /= pop
      end

      def mod
        @register %= pop
      end

      def mult
        @register *= pop
      end

      def sub
        @register -= pop
      end

      def print
        puts @register
      end
    end

    ```

- LS discussion:

    In some ways, this problem is easier to solve than its procedural version, but error handling makes things a bit more complicated. We also take a somewhat different approach to performing each operation, using separate methods instead of a `case`.

    We start by observing that our interface, as shown in the examples, calls for a class named Minilang, and an initializer that takes our minilang program as a string input. The interface also requires an `eval` method to evaluate and run the program. So, we set up a class that does just this.

    The `eval` method first creates instance variables, `@register` and `@stack`, for use in emulating the stack and register of our language processor. Then, it iterates through all of our tokens, processing them one at a time. It also captures and reports any exceptions raised during processing.

    Both of the exceptions we can raise are defined as subclasses of the `MinilangError` exception class, which, in turn, is a subclass of the built-in `StandardError` exception class. Having `MinilangError` between `StandardError` and our two real exception classes lets us easily rescue either of the exceptions that may occur.

    `eval` calls our workhorse method, `eval_token` for each token in our program. You might, at this point, be tempted to use something like `Object#respond_to?` to distinguish actions that can be executed, but this isn't precise, and will likely cause unexpected behaviors. To avoid this, we instead keep a list of valid tokens in ACTIONS, and check that list for the action tokens we want. If we find one, we call the appropriate method via `Object#send`.

    In addition to action tokens, we also need to handle integer tokens, so we check for integer values using the regex shown, and, if we have a match, we just convert the token to an integer and stick it in our register, replacing whatever value was already there.

    If the token is neither a valid action nor an integer token, we raise a `BadTokenError` exception to terminate the program.

    All of the actions are implemented as very simple (mostly one-liner) methods named for each action. Each method operates on our `@stack` and `@register` instance variables, and performs the specific action requested.

**7. Number guesser part 1**

Create an object-oriented number guessing class for numbers in the range 1 to 100, with a limit of 7 guesses per game. The game should play like this:

```ruby
game = GuessingGame.new
game.play

You have 7 guesses remaining.
Enter a number between 1 and 100: 104
Invalid guess. Enter a number between 1 and 100: 50
Your guess is too low.

You have 6 guesses remaining.
Enter a number between 1 and 100: 75
Your guess is too low.

You have 5 guesses remaining.
Enter a number between 1 and 100: 85
Your guess is too high.

You have 4 guesses remaining.
Enter a number between 1 and 100: 0
Invalid guess. Enter a number between 1 and 100: 80

You have 3 guesses remaining.
Enter a number between 1 and 100: 81
That's the number!

You won!

game.play

You have 7 guesses remaining.
Enter a number between 1 and 100: 50
Your guess is too high.

You have 6 guesses remaining.
Enter a number between 1 and 100: 25
Your guess is too low.

You have 5 guesses remaining.
Enter a number between 1 and 100: 37
Your guess is too high.

You have 4 guesses remaining.
Enter a number between 1 and 100: 31
Your guess is too low.

You have 3 guesses remaining.
Enter a number between 1 and 100: 34
Your guess is too high.

You have 2 guesses remaining.
Enter a number between 1 and 100: 32
Your guess is too low.

You have 1 guesses remaining.
Enter a number between 1 and 100: 32
Your guess is too low.

You have no more guesses. You lost!
```

Note that a game object should start a new game with a new number to guess with each call to `#play`.

```ruby
class GuessingGame
  MIN_NUM  = 1
  MAX_NUM = 100

  def initialize
    @number_of_guesses = 7
    @number_entered = nil
    @target_number = rand(MIN_NUM..MAX_NUM)

  end

  def play
    loop do
      display_number_of_guesses
      display_guess_number
      display_response
      update_number_of_guesses
      break if no_guesses? || winner?
    end
  end

  private

  attr_accessor :number_of_guesses, :number_entered
  attr_reader :target_number

  def display_number_of_guesses
    puts "You have #{number_of_guesses} guesses remaining."
  end

  def display_guess_number
    response = nil
    loop do
      puts "Enter a number between #{MIN_NUM} and #{MAX_NUM}:"
      response = gets.chomp.to_i
      break if valid_input?(response)
      puts "Invalid guess."
    end

    self.number_entered = response
  end

  def valid_input?(response)
    (MIN_NUM..MAX_NUM).include?(response)
  end

  def display_response
    if number_entered == target_number
      puts "That's the number!"
    elsif number_entered < target_number
      puts "Your guess is too low."
    elsif number_entered > target_number
      puts "Your guess is too high."
    end
  end

  def winner?
    win_message if number_entered == target_number
  end

  def win_message
    puts "You've won!"
    true
  end

  def update_number_of_guesses
    self.number_of_guesses -= 1
  end

  def lost_message
    puts "You have no more guesses. You lost!"
    true
  end

  def no_guesses?
    lost_message if number_of_guesses == 0
  end
end

game = GuessingGame.new
game.play
```

**7. Number guesser part 2**

In the previous exercise, you wrote a number guessing game that determines a secret number between 1 and 100, and gives the user 7 opportunities to guess the number.

Update your solution to accept a low and high value when you create a `GuessingGame` object, and use those values to compute a secret number for the game. You should also change the number of guesses allowed so the user can always win if she uses a good strategy. You can compute the number of guesses with:

```ruby
Math.log2(size_of_range).to_i + 1
```

```ruby
game = GuessingGame.new(501, 1500)
game.play

You have 10 guesses remaining.
Enter a number between 501 and 1500: 104
Invalid guess. Enter a number between 501 and 1500: 1000
Your guess is too low.

You have 9 guesses remaining.
Enter a number between 501 and 1500: 1250
Your guess is too low.

You have 8 guesses remaining.
Enter a number between 501 and 1500: 1375
Your guess is too high.

You have 7 guesses remaining.
Enter a number between 501 and 1500: 80
Invalid guess. Enter a number between 501 and 1500: 1312
Your guess is too low.

You have 6 guesses remaining.
Enter a number between 501 and 1500: 1343
Your guess is too low.

You have 5 guesses remaining.
Enter a number between 501 and 1500: 1359
Your guess is too high.

You have 4 guesses remaining.
Enter a number between 501 and 1500: 1351
Your guess is too high.

You have 3 guesses remaining.
Enter a number between 501 and 1500: 1355
That's the number!

You won!

game.play
You have 10 guesses remaining.
Enter a number between 501 and 1500: 1000
Your guess is too high.

You have 9 guesses remaining.
Enter a number between 501 and 1500: 750
Your guess is too low.

You have 8 guesses remaining.
Enter a number between 501 and 1500: 875
Your guess is too high.

You have 7 guesses remaining.
Enter a number between 501 and 1500: 812
Your guess is too low.

You have 6 guesses remaining.
Enter a number between 501 and 1500: 843
Your guess is too high.

You have 5 guesses remaining.
Enter a number between 501 and 1500: 820
Your guess is too low.

You have 4 guesses remaining.
Enter a number between 501 and 1500: 830
Your guess is too low.

You have 3 guesses remaining.
Enter a number between 501 and 1500: 835
Your guess is too low.

You have 2 guesses remaining.
Enter a number between 501 and 1500: 836
Your guess is too low.

You have 1 guesses remaining.
Enter a number between 501 and 1500: 837
Your guess is too low.

You have no more guesses. You lost!
```

Note that a game object should start a new game with a new number to guess with each call to #play.

```ruby
class GuessingGame
  def initialize(min, max)
    @min_number = min
    @max_number = max
    @size_of_range = (min..max).size
    @number_of_guesses = Math.log2(@size_of_range).to_i + 1
    @number_entered = nil
    @target_number = rand(min..max)
  end

  def play
    loop do
      display_number_of_guesses
      display_guess_number
      display_response
      update_number_of_guesses
      break if no_guesses? || winner?
    end
  end

  private

  attr_accessor :number_of_guesses, :number_entered
  attr_reader :target_number

  def display_number_of_guesses
    puts "You have #{number_of_guesses} guesses remaining."
  end

  def display_guess_number
    response = nil
    loop do
      puts "Enter a number between #{@min_number} and #{@max_number}:"
      response = gets.chomp.to_i
      break if valid_input?(response)
      puts "Invalid guess."
    end

    self.number_entered = response
  end

  def valid_input?(response)
    (@min_number..@max_number).include?(response)
  end

  def display_response
    if number_entered == target_number
      puts "That's the number!"
    elsif number_entered < target_number
      puts "Your guess is too low."
    elsif number_entered > target_number
      puts "Your guess is too high."
    end
  end

  def winner?
    win_message if number_entered == target_number
  end

  def win_message
    puts "You've won!"
    true
  end

  def update_number_of_guesses
    self.number_of_guesses -= 1
  end

  def lost_message
    puts "You have no more guesses. You lost!"
    true
  end

  def no_guesses?
    lost_message if number_of_guesses == 0
  end
end

game = GuessingGame.new(501, 1500)
game.play
```

**7. Highest and lowest ranking cards**

Update this class so you can use it to determine the lowest ranking and highest ranking cards in an `Array` of `Card` objects:

```ruby
class Card
  attr_reader :rank, :suit

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end
end
```

For this exercise, numeric cards are low cards, ordered from 2 through 10. Jacks are higher than 10s, Queens are higher than Jacks, Kings are higher than Queens, and Aces are higher than Kings. The suit plays no part in the relative ranking of cards.

If you have two or more cards of the same rank in your list, your `min` and `max` methods should return one of the matching cards; it doesn't matter which one.

Besides any methods needed to determine the lowest and highest cards, create a `#to_s` method that returns a String representation of the card, e.g., `"Jack of Diamonds"`, `"4 of Clubs"`, etc.

Examples:

```ruby
cards = [Card.new(2, 'Hearts'),
         Card.new(10, 'Diamonds'),
         Card.new('Ace', 'Clubs')]
puts cards
puts cards.min == Card.new(2, 'Hearts')
puts cards.max == Card.new('Ace', 'Clubs')

cards = [Card.new(5, 'Hearts')]
puts cards.min == Card.new(5, 'Hearts')
puts cards.max == Card.new(5, 'Hearts')

cards = [Card.new(4, 'Hearts'),
         Card.new(4, 'Diamonds'),
         Card.new(10, 'Clubs')]
puts cards.min.rank == 4
puts cards.max == Card.new(10, 'Clubs')

cards = [Card.new(7, 'Diamonds'),
         Card.new('Jack', 'Diamonds'),
         Card.new('Jack', 'Spades')]
puts cards.min == Card.new(7, 'Diamonds')
puts cards.max.rank == 'Jack'

cards = [Card.new(8, 'Diamonds'),
         Card.new(8, 'Clubs'),
         Card.new(8, 'Spades')]
puts cards.min.rank == 8
puts cards.max.rank == 8
```

```ruby
class Card
  include Comparable
  attr_reader :rank, :suit

  FACE_CARDS = { 'Jack' => 11, 'Queen' => 12, 'King' => 13, 'Ace' => 14 }
  
  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def to_s
    "#{rank} of #{suit}"
  end

  def value
    FACE_CARDS.fetch(rank, rank)   
  end

  def <=>(other_card)
    value <=> other_card.value
  end
end
```

Passing in `@rank` twice to `Hash#fetch` means if the key isn't found (i.e. the `rank` is an Integer) then `@rank` will be returned. 

**8. Deck of cards**

Using the Card class from the previous exercise, create a Deck class that contains all of the standard 52 playing cards. Use the following code to start your work:

```ruby
class Deck
  RANKS = ((2..10).to_a + %w(Jack Queen King Ace)).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze
end
```

The Deck class should provide a `#draw` method to deal one card. The `Deck` should be shuffled when it is initialized and, if it runs out of cards, it should reset itself by generating a new set of 52 shuffled cards.

```ruby
deck = Deck.new
drawn = []
52.times { drawn << deck.draw }
drawn.count { |card| card.rank == 5 } == 4
drawn.count { |card| card.suit == 'Hearts' } == 13

drawn2 = []
52.times { drawn2 << deck.draw }
drawn != drawn2 # Almost always.
```

```ruby
class Card
  include Comparable
  attr_reader :rank, :suit

  FACE_CARDS = { 'Jack' => 11, 'Queen' => 12, 'King' => 13, 'Ace' => 14 }
  
  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def to_s
    "#{rank} of #{suit}"
  end

  def value
    FACE_CARDS.fetch(rank, rank)   
  end

  def <=>(other_card)
    value <=> other_card.value
  end
end

class Deck
  RANKS = ((2..10).to_a + %w(Jack Queen King Ace)).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze

  def initialize
    create_deck
  end

  def draw
    create_deck if @deck.empty?

    @deck.pop
  end

  private

  def create_deck
    cards = []
    RANKS.each do |card_rank|
      SUITS.each do |card_suit|
        cards << Card.new(card_rank, card_suit)
        end
      end
    cards.shuffle!
    @deck = cards 
  end
end
```