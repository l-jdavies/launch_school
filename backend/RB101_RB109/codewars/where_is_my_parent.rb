# Legend:
# -Uppercase letters stands for mothers, lowercase stand for their children, i.e. "A" mother's children are "aaaa".
# -Function input: String contains only letters, uppercase letters are unique.
# Task:
# Place all people in alphabetical order where Mothers are followed by their children, i.e. "aAbaBb" => "AaaBbb".

def same_letter(arr)
  new_str = arr.shift

  loop do
    if arr[0] == new_str[-1]
      new_str << arr.shift
    else
      break
    end
  end
  new_str
end

def find_children(str)
  arr = str.downcase.chars.sort
  
  arr_words = []
  
  until arr.empty?
    arr_words << same_letter(arr) 
  end
  
  arr_words.map { |word| word.capitalize }.join('')
end
