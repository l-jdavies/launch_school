# Write a program that can generate the lyrics of the 99 Bottles of Beer song. See the test suite for the entire song.

# PEDAC
# RULES
# create a BeerSong class
# test suite always creates instance of `BeerSong`
# create a `verse` method
# `verse`should take one or two arguments
# second argument is optional
# first argument determines how many bottles of beer song should start with
# if argument = 0, song should be 'no more'
# `verse` should print lines of the song. 
# if no value is passed in as the second argument, `verse` should print 2 lines
# if a second argument is passed in, the song should count down the number of bootles from the first argument to the second
# create a `lyrics` method that starts at 99 bottles and prints the full song until there are no more bottles
require 'byebug'
class BeerSong
  def verse(start)
    @bottles = start
    
    if @bottles.zero?
      zero_bottles
    elsif @bottles == 1
      one_bottle_left
    elsif @bottles == 2
      two_bottles
    else
      one_verse
    end
  end

  def verses(start, end_bottle)
    verse_output = ''
    num_bottles = start
    loop do
      verse_output << verse(num_bottles)
      verse_output << "\n"
      num_bottles -= 1
      break if num_bottles < end_bottle
    end
    verse_output.chomp
  end

  def lyrics
    verses(99, 0)
  end

  private

  def one_verse
    "#{@bottles} bottles of beer on the wall, #{@bottles} bottles of beer.\nTake one down and pass it around, #{(@bottles - 1)} bottles of beer on the wall.\n"
  end

  def one_bottle_left
    "1 bottle of beer on the wall, #{@bottles} bottle of beer.\nTake it down and pass it around, no more bottles of beer on the wall.\n"
  end

  def two_bottles
    "2 bottles of beer on the wall, 2 bottles of beer.\nTake one down and pass it around, 1 bottle of beer on the wall.\n"
  end

  def zero_bottles
    "No more bottles of beer on the wall, no more bottles of beer.\nGo to the store and buy some more, 99 bottles of beer on the wall.\n"
  end
end
