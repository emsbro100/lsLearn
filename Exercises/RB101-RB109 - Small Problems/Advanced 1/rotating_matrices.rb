=begin
Write a method that takes an arbitrary matrix and rotates it 90 degrees clockwise as shown above.

input: array of arrays of integers (matrix)
output: array of arrays of integers (matrix)

rules:
- does not need to handle improper inputs
- should not mutate the argument, output should be a new object

data structure:
- nested arrays as input
- nested arrays as output

algorithm:
rotate90
========
- given input matrix 'matrix'
- initialize new array 'rotated_matrix'
- for each subarray in matrix' subarrays (each column, x)
  - create a new array 'new_row'
  - for each subarray in matrix, starting at the last one (each row, y)
    - add the item at the current column (x) for the current row (y) to new_row
  - add new_row to rotated_matrix
- return rotated_matrix
=end

def rotate90(matrix)
  rotated_matrix = []

  matrix[0].size.times do |x|
    new_row = []

    matrix.size.times do |y|
      new_row.push(matrix[matrix.size - 1 - y][x])
    end
  
    rotated_matrix.push(new_row)
  end

  rotated_matrix
end

matrix1 = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

matrix2 = [
  [3, 7, 4, 2],
  [5, 1, 0, 8]
]

new_matrix1 = rotate90(matrix1)
new_matrix2 = rotate90(matrix2)
new_matrix3 = rotate90(rotate90(rotate90(rotate90(matrix2))))

p new_matrix1 == [[3, 4, 1], [9, 7, 5], [6, 2, 8]]
p new_matrix2 == [[5, 3], [1, 7], [0, 4], [8, 2]]
p new_matrix3 == matrix2
