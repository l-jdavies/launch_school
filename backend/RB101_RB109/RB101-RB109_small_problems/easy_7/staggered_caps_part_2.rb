# Modify the method from the previous exercise so it ignores non-alphabetic characters when determining
# whether it should uppercase or lowercase each letter
# The non-alphabetic characters should still be included in the return value
# they just don't count when toggling the desired case.

require 'byebug'
ALPHABETIC = ('A'..'Z').to_a + ('a'..'z').to_a

def staggered_case(string)
  new_string = ''
  need_upcase = true

  string.downcase.chars.each do |character|
    if ALPHABETIC.include?(character) == false
      new_string += character
    else
      if need_upcase
        new_string += character.upcase
        need_upcase = !need_upcase
      else
        new_string += character
        need_upcase = !need_upcase
      end
    #byebug
    end
  end
  new_string
end

staggered_case('I Love Launch School!')
