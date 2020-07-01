def titleize(string)
  arr = string.split(" ")

  arr.map! do |word|
    word.capitalize
  end

  modified_string = arr.join(" ")
end
