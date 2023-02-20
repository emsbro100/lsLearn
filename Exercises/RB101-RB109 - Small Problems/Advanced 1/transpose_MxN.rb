=begin

transpose() takes one argument, a matrix
needs to be able to transpose non-square matrices

take input array figure out w/h, then create a new empty array with reversed w/h
progressively insert rows/columns into new array

=end

def transpose(matrix)
  result = Array.new(matrix[0].size) { Array.new(matrix.size) {[]} }

  matrix.each_with_index do |row, row_number|
    row.each_with_index { |value, column| result[column][row_number] = value }
  end

  result
end

puts transpose([[1, 2, 3, 4]]) == [[1], [2], [3], [4]]
puts transpose([[1], [2], [3], [4]]) == [[1, 2, 3, 4]]
puts transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]) ==
  [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
puts transpose([[1]]) == [[1]]
