# Write a program that uses the Sieve of Eratosthenes to find all the primes from 2 up to a given number.

# The Sieve of Eratosthenes is a simple, ancient algorithm for finding all prime numbers up to any given limit. It does so by iteratively marking as composite (i.e. not prime) the multiples of each prime, starting with the multiples of 2.

# Create your range, starting at two and continuing up to and including the given limit. (i.e. [2, limit]).

# The algorithm consists of repeating the following over and over:

# * take the next available unmarked number in your list (it is prime)
# * mark all the multiples of that number (they are not prime)

# Repeat until you have processed each number in your range. When the algorithm terminates, all the numbers in the list that have not been marked are prime. The wikipedia article has a useful graphic that explains the algorithm.

# Notice that this is a very specific algorithm, and the tests don't check that you've implemented the algorithm, only that you've come up with the correct list of primes.

# PEDAC
# INPUT
# integer - represents maximum number in range (n)
#
# OUTPUT
# array of prime numbers from 2 to n
#
# DATA STRUCTURE
# hash - use integer as key and value to mark/unmark
#
# ALGORITHM
# create a hash (numbers)in which the keys are from 2 to n and the values are all set as 'unmarked'
# initialize a `counter` value initially set to `2`
# iterate over the `numbers` keys and for any key that has a value of `unmarked` and is evenly divided by the counter, set the value as `marked`
# set `counter` to the next key with the value `unmarked`
# stop the iteration if all of the keys that were multiples of `counter` already had the value `marked`
# use a flag to indicate marking has occurred during iteration?
# return an array of `numbers` keys
#
# PSUEDOCODE 
# SET `numbers` = {} keys are from 2..n; values all 'unmarked'
# SET counter = 2
# SET mark_occured? = false
#
# UNTIL mark_occured? == false
# access `numbers` keys and select keys for which value == 'unmarked'
# iterate over keys
#   IF key % `counter` == 0
#     reassign value of key to `marked`
#     mark_occured? = true
#   END
# reassign counter to next key with value 'unmarked' => extract logic to helper method
# END
#
# return `numbers` keys
class Sieve
  attr_reader :number_hash

  def initialize(num)
    @max_number = num
    @number_hash = create_hash
    @counter = 2
  end

  def primes
    unmarked_multiples = multiple_of_counter

    until unmarked_multiples.empty?
      unmarked_multiples.each { |num| @number_hash[num] = 'marked' }
      increment_counter
      unmarked_multiples = multiple_of_counter
    end

    select_unmarked_keys
  end

  private

  def increment_counter
    loop do
      if @number_hash[@counter + 1] == 'unmarked'
        @counter += 1
        break
      else
        @counter += 1
      end
      break if @counter > @max_number
    end
  end

  def multiple_of_counter
    unmarked_keys = select_unmarked_keys
    unmarked_keys.select { |key| key % @counter == 0 unless key == @counter }
  end

  def select_unmarked_keys
    @number_hash.select { |_, v| v == 'unmarked' }.keys
  end

  def create_hash
    hsh = {}

    2.upto(@max_number) do |num|
      hsh[num] = 'unmarked'
    end
    hsh
  end
end

test = Sieve.new(10)
puts test.primes
