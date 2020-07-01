# Implement the `search` method so passing in `query` and `query2` as arguments returns the expected arrays
# search(query)
# => [ { name: "Thinkpad x220", price: 250} ]

# search(query2)
#  => [ { name: "Dell Inspiron", price: 300}, { name: "Dell Inspiron", price 450} ]

# INPUT
# hash
#
# OUTPUT
# return an array of hashes
#
# RULES
# write `search` method that returns an array containing hashes that match the criteria stated in the `query` input hash.
#
# ALGORITHM
# iterate over the array to access individual hashes
# search the `:name` values for elements match the `q` values in the `query` hash
# the `q` values in the `query` hash are lowercase - capitalize them
# search the results from above the find `PRODUCTS` hashes in which the `price` values are between the `price_min` and `price_max` values in the `query` hash
# return hashes that match both search criteria
#
# START
#
# SET match_criteria = []
#
# iterate over array to access hash elements
#
# select hash in which the key == `name` and the value includes the `q` value (.capitalize) from the `query` hash 
# and select elements in which the key == `price` and the value is between `price_min` and `price_max` from `query` hash
#
# returned results assigned to match_criteria
#
# return match_criteria
#
# END

def search(query_hash)
  match_criteria = []
  PRODUCTS.each do |hash|
    if hash[:name].include?(query_hash[:q].capitalize) && hash[:price].between?(query_hash[:price_min], query_hash[:price_max]) 
      match_criteria << hash
    end
  end
  match_criteria
end

PRODUCTS = [
  { name: "Thinkpad x210", price: 220},
  { name: "Thinkpad x230", price: 250},
  { name: "Thinkpad x250", price: 979},
  { name: "Thinkpad x230", price: 300},
  { name: "Thinkpad x230", price: 330},
  { name: "Thinkpad x230", price: 350},
  { name: "Thinkpad x240", price: 700},
  { name: "Macbook Leopard", price: 300},
  { name: "Macbook Air", price: 700},
  { name: "Macbook Pro", price: 600},
  { name: "Macbook", price: 1449},
  { name: "Dell Latitude", price: 200},
  { name: "Dell Latitude", price: 650},
  { name: "Dell Inspiron", price: 300},
  { name: "Dell Inspiron", price: 450}
]

query = {
  price_min: 240,
  price_max: 280,
  q: "thinkpad"
}

query2 = {
  price_min: 300,
  price_max: 450,
  q: 'dell'
}

search(query)
