# Write a method that returns the number of Friday the 13ths in the year given by an argument.
# ou may assume that the year is greater than 1752 (when the United Kingdom adopted the modern Gregorian Calendar) and that it will remain in use for the foreseeable future.
#
#
# Note, I couldn't do this one so I worked through the LS solution

require 'date'

def friday_13th(year)
  unlucky_count = 0

  thirteenth = Date.new(year, 1, 13)
  12.times do
    unlucky_count += 1 if thirteenth.friday?
    thirteenth = thirteenth.next_month
  end
  unlucky_count
end

# this isn't actually too difficult once you look at the Date class methods
# `thirteenth = Date.new(year, 1, 13)` assigns a date, starting on Jan 1st of the input year to the local variable thirteenth
# `unlucky_count` is incremented by 1 if the date assigned to `thirteenth` is a friday (using the `friday?` method)
# then `thirteenth` is reassigned to the 13th day of the next month
# the above process is repeated 12 times i.e. the 13th day of each month is checked to see if it's a Friday
# at the end the total number of months in which the 13th day is a friday is returned.
