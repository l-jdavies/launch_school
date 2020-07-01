# given a year number, find the minimum year
# number which is strictly larger than the given one
# and has only distinct digits.
#
# INPUT
# integer
#
# OUTPUT
# integer
#
# RULES
# output integer has to be greater than input integer
#
# ALGORITHM
# split the `year` into digits
# iterate over the digits and count if `digit` is present in `digits` > 1
#   if true, increment `year` by 1
#   if false, return `year`

def distinct_digit_year(year)
  year = year + 1

  until year.digits.uniq.size == year.digits.size
    year += 1
  end
  year
end
