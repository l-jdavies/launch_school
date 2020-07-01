# Write a method that finds the longest substring that is a palindrome within a string.

def longest_palindrome(str)
  palindromes(str).sort.first
end

def palindromes(str)
  palin_arr = []

  substrings(str).select { |substr| substr == substr.reverse }
end

def substrings(str)
  idx = 0

  sub_str = []
  arr = str.chars

  loop do
    end_range = 1
    loop do
      sub_str << arr[idx..end_range] unless arr[idx..end_range].length < 2
      end_range += 1
      break if end_range == arr.length
    end
    idx += 1
    break if idx == arr.length
  end
  sub_str.map { |subarr| subarr.join('') }
end


