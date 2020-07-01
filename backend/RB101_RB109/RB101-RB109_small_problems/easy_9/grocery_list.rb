# Write a method which takes a grocery list (array) of fruits with quantities and converts it into an array of the correct number of each fruit.

def buy_fruit(arr)
list_fruit = []
 
arr.each do |subarr|
  subarr[1].times do |n|
    list_fruit << subarr[0]
  end
end

list_fruit
end

