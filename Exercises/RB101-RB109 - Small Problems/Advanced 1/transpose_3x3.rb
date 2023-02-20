=begin

transpose method takes one argument, a multidimensional array
iterate through each array with its index, then each subarray with its index
assign the values of each subarray using the reversed indexes

=end

def transpose(arr)
  new_arr = Array.new(arr.size) {[]}

  arr.each_with_index do |subarr, idx|
    subarr.each_with_index { |value, idx_2| new_arr[idx_2][idx] = value }
  end

  new_arr
end

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

new_matrix = transpose(matrix)

p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]
