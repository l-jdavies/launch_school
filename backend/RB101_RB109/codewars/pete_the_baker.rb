# Write a function cakes(), which takes the recipe (object) and the available ingredients (also an object) 
# and returns the maximum number of cakes Pete can bake (integer)
# For simplicity there are no units for the amounts (e.g. 1 lb of flour or 200 g of sugar are simply 1 or 200).
# Ingredients that are not present in the objects, can be considered as 0.
def cakes(recipe, available)
  result = []

  return 0 if recipe.keys.count > available.keys.count
  
  recipe.each do |ingredient, amount|
    if (available[ingredient])
      result << (available[ingredient]/ amount)
    else
      result << 0
    end
  end
  
  result.min
end
