# mplement a function likes :: [String] -> String, which must take in input array, containing the names of people who like an item. It must return the display text as shown in the examples:
#

def likes(arr)
  if arr.empty?
    "no one likes this"
  elsif arr.length == 1
    "#{arr[0]} likes this"
  elsif arr.length == 2
    "#{arr[0]} and #{arr[1]} like this"
  elsif arr.length == 3
    "#{arr[0]}, #{arr[1]} and #{arr[2]} like this"
  else
    "#{arr.shift}, #{arr.shift} and #{arr.count} others like this"
  end
end
