def palindrome_part_2(string)
  string = string.downcase.delete('^a-z0-9') #got regex from solution
  string == string.reverse
end
