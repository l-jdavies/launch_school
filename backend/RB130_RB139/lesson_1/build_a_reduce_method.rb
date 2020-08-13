def reduce(array, val=0)
  accum = val

  array.each do |el| 
    accum = yield(accum, el)
  end

  accum
end

array = [1, 2, 3, 4, 5]
puts reduce(array) { |acc, num| acc + num  }                    # => 15
puts reduce(array, 10) { |acc, num| acc + num  }                # => 25
puts reduce(array) { |acc, num| acc + num if num.odd?  }        # => NoMethodError: undefined method `+' for nil:NilClass'`
