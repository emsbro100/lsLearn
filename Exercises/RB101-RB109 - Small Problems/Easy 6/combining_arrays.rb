=begin
Write a  method that takes two Arrays as arguments, and returns an Array that
contains all o fthe values from othe argument Arrays. There should be no
duplication of values in the returned Array, even if there are duplicates in the
original arrays.

input: array, array
output: array

explicit rules:
- remove all duplicate values
implicit rules:
- does not need to be able to handle improper inputs

data structure:
- two arrays as inputs
- single array as output

algorithm:
merge
=====
- given input arrays 'first_array' and 'second_array'
- merge both arrays into a new array 'merged_arr', then remove duplicate values
- return merged_arr
=end

def merge(first_array, second_array)
  first_array.union(second_array)
end

puts merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]
