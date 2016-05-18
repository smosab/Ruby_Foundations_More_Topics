require 'pry'

def each(array)
  counter = 0
  # counter = array.size
  while counter < array.size
    # binding.pry
    yield(array[counter])
    counter += 1
  end
end

array = [1, 2, 3, 4, 5]

each(array) do |e|
  # binding.pry
    puts e.to_s + "1"
  end