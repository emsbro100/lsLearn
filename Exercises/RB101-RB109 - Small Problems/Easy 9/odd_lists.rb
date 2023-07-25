=begin
Write a method that returns an Array that contains every other element of an
Array that is passed in as an argument. The values in the returned list should
be those values that are in the 1st, 3rd, 5th, and so on elements of the
argument Array.

input: array
output: array

rules:
- input array can be empty
- input array can contain multiple object types

data structure:
- array as input
- array as output

algorithm:
oddities
========
- given input array 'arr'
- create a new array 'oddities'
- for each element in arr:
  - if the element has an even index, append it to oddities
- return oddities
=end

def oddities(arr)
  oddities = []
  arr.each_with_index { |obj, idx| oddities.push(obj) if idx.even? }
  oddities
end

p oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
p oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
p oddities(['abc', 'def']) == ['abc']
p oddities([123]) == [123]
p oddities([]) == []
p oddities([1, 2, 3, 4, 1]) == [1, 3, 1]
