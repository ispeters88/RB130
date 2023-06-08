require "pry-byebug"

def reduce(collection, start = nil)
  idx, size, data_type = 0, collection.size, collection[0].class

  if start
    accum = start
  else
    accum = data_type == Integer ? 0 : data_type.new
  end
  
  #binding.pry

  while idx < size
    raise ArgumentError.new("Different data types") unless collection[idx].class == data_type
    #binding.pry
    accum = yield(accum, collection[idx])
    idx += 1
  end
  
  p accum
end

t1 = [1, 2, 3, 4, 5, 6, 7]
t2 = 'hello'
t3 = ['this', 'is', 'an', 'array', 'of', 'words']
t4 = [[1, 2, 3], [4, 5, 6]]

p reduce(t1) { |memo, num| memo += num }

reduce(t2) do |memo, letter|
  memo << letter * 2
end

reduce(t3) { |memo, word| memo << word.upcase }
reduce(t4) { |memo, arr| memo += arr }