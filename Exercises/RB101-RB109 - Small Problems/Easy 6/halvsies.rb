=begin
Write a method that takes an Array as an argument, and returns two Arrays (as a
pair of nested Arrays) that contain the first half and second half of the
original Array, respectively. If the original array contains an odd number of
elements, the middle element should be placed in the first half Array.

input: array
output: array

explicit rules:
- if there is an odd number of objects, put the middle object in the first array
implicit rules:
- must handle empty array inputs
- does not need to handle improper inputs

data structure:
- array as input
- nested arrays as output
- integer to mark the halfway point

algorithm:
halvsies
========
- given input 'arr'
- create new array with two empty nested arrays 'split_arr'
- divide the size of arr by 2 and round up to a whole value, then store that
  integer as a new variable 'half'
- iterate through arr, while index < (half - 1) append each object to the first
  array in split_arr, then afterwards append each objects to the second array
- return split_arr
=end

def halvsies(arr)
  split_arr = [[], []]
  half = (arr.size / 2.0).ceil

  arr.each_with_index do |obj, idx|
    idx < half ? split_arr[0].push(obj) : split_arr[1].push(obj)
  end

  split_arr
end

puts halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
puts halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
puts halvsies([5]) == [[5], []]
puts halvsies([]) == [[], []]
