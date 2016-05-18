require 'pry'

def select(array)
  counter = 0
  new_array = []

  while counter < array.size
    new_array << (array[counter]) if yield(array[counter])
    counter += 1
  end

  new_array
end

array = [1, 2, 3, 4, 5]

p select(array) { |e| e.odd? }