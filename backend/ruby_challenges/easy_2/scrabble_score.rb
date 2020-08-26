# Write a program that, given a word, computes the scrabble score for that word.
# 
# Letter Values
# You'll need these:
# 
# Letter                           Value
# A, E, I, O, U, L, N, R, S, T       1
# D, G                               2
# B, C, M, P                         3
# F, H, V, W, Y                      4
# K                                  5
# J, X                               8
# Q, Z                               10
# Examples
# "cabbage" should be scored as worth 14 points:
# 
# 3 points for C
# 1 point for A, twice
# 3 points for B, twice
# 2 points for G
# 1 point for E
# And to total:
# 
# 3 + 2*1 + 2*3 + 2 + 1
# = 3 + 2 + 6 + 3
# = 5 + 9
# = 14

# PEDAC
# INPUT
# string
#
# OUTPUT
# integer
#
# RULES
# white space or nil should return 0
# score calculation is not case sensitive
# test suite creates instance of `Scrabble` and invokes `score` method on instance
# test suite also calls `score` method directly on `Scrabble` class
#
# ALGORITHM
# iterate over each character in string
# use regex to determine pattern matches
#
# PSEUDOCODE
# SET score = 0
#
# iterate over each character in `input_str`
# case
# when uppercase version of character matches A, E, I, O, U, L, N, R, S, T
# increment score by 1
# when uppercase version of character matches D, G
# increment score by 2
# ...and so on for all letters
#
# return score

class Scrabble
  ONE_POINT = /[AEIOULNRST]/i
  TWO_POINTS = /[DG]/i
  THREE_POINTS = /[BCMP]/i
  FOUR_POINTS = /[FHVWY]/i
  FIVE_POINTS = /[K]/i
  EIGHT_POINTS = /[JX]/i
  TEN_POINTS = /[QZ]/i

  def initialize(word)
    @word = word
  end

  def self.score(word)
    score = 0

    return score if word.nil?

    word.each_char do |letter|
      case
      when letter.match?(ONE_POINT)
        score += 1
      when letter.match?(TWO_POINTS)
        score += 2
      when letter.match?(THREE_POINTS)
        score += 3
      when letter.match?(FOUR_POINTS)
        score += 4
      when letter.match?(FIVE_POINTS)
        score += 5
      when letter.match?(EIGHT_POINTS)
        score += 8
      when letter.match?(TEN_POINTS)
        score += 10
      else
        score += 0
      end
    end
    score
  end

  def score
    self.class.score(@word)
  end
end


