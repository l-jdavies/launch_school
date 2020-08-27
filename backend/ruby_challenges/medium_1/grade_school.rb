# Write a small archiving program that stores students' names along with the grade that they are in.
# 
# In the end, you should be able to:
# 
# Add a student's name to the roster for a grade
# "Add Jim to grade 2."
# "OK."
# Get a list of all students enrolled in a grade
# "Which students are in grade 2?"
# "We've only got Jim just now."
# Get a sorted list of all students in all grades. Grades should sort as 1, 2, 3, etc., and students within a grade should be sorted alphabetically by name.
# 
# {1=>["Anna", "Barb", "Charlie"], 2=>["Alex", "Peter"], ...}
# The exact output format doesn't matter: what's important is that it shows all of the students and grades in the proper order.
# 
# Note that all our students only have one name. (It's a small town, what do you want?)
#
# PEDAC
# INPUT
# `add` method takes two arguments - name, grade
#
# OUTPUT
# hash in which the keys are grades (integers) and values are a sorted array of names
# 
# RULES
# from test suite:
# instance of the School class will be created
# only need instance methods
# methods required:
# `add` adds a student to the class object in addition to a grade
# `to_h` returns hash (with values sorted)
# `grade`, takes an integer as an argument and returns array of sorted names
#
# ALGORITHM
# `initialize`
# @school = {}
#
# `add(name, grade)`
# if grade isn't present as a key in `@school`
#   add grade to `@school` as key and `name` in an array as the value
# if it is present, push the name to the existing value array
#
# `to_h`
# return `@school` with all value arrays sorted
#
# `grade(num)`
# return an array of values for given key

class School
  def initialize
    @school = Hash.new
  end

  def add(name, grade)
    if @school[grade].nil?
      @school[grade] = [name]
    else
      @school[grade] << name
    end
  end

  def to_h
    hsh = Hash.new

    @school.keys.sort.each do |k|
        hsh[k] = @school[k].sort
      end

    hsh
  end

  def grade(num)
    return Array.new if @school[num].nil?

    @school.values_at(num).sort.flatten
  end
end


