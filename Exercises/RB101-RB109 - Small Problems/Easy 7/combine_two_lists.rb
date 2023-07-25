=begin
Write a method that combines two Arrays passed in as arguments, and returns a
new Array that contains all elements from both Array arguments, with the
elements taken in alternation.

You may assume that both input Arrays are non-empty, and that they have the same
number of elements.

input: array, array
output: array

explicit rules:
- both inputs will be non-empty
- both inputs have the same number of elements
implicit rules:
- does not need to be able to handle improper inputs
- must handle any object type within the input arrays

data structure:
- arrays as inputs
- array as output

algorithm:
interleave
==========
- given input arrays 'first_arr' and 'second_arr'
- create a new array 'combined_arr'
- for each index in the first array, append the element from first_arr at that
  index to combined_arr, then append the element from second_arr at that index
- return combined_arr
=end

def interleave(first_arr, second_arr)
  combined_arr = []

  first_arr.each_index do |idx|
    combined_arr.push(first_arr[idx])
    combined_arr.push(second_arr[idx])
  end

  combined_arr
end

puts interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']
