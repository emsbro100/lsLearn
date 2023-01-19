numbers = [5, 2, 9, 6, 3, 1, 8]

even_numbers = numbers.select do |n|
  n if n.even?
end

p even_numbers # expected output: [2, 6, 8]

# It doesn't work currently because #map maps the value at the specified index
# to the return value for that iteration. That means that if the numer n isn't
# even then the return value is nil, so nil is what is mapped.