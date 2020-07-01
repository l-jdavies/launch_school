def select_fruit(hash)
  hash_keys = hash.keys
  selected_fruits = {}
  index_count = 0

  until index_count == hash_keys.size

    current_key = hash_keys[index_count]
    current_value = hash[current_key]

    if current_value == 'Fruit'
      selected_fruits[current_key] = current_value
    end

    index_count += 1

  end
selected_fruits
end
