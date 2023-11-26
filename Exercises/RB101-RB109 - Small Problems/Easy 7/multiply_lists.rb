=begin
Write a method that takes two Array arguments in which each Array contains a
list of numbers, and returns a new Array that contains the product of each pair
of numbers form the arguments that have the same index. You may assume that the
arguments contain the same number of elements.

input: array, array
output: array

rules:
- arguments will contain the same number of elements
- does not need to handle improper inputs

data structure:
- arrays as inputs
- array as output

algorithm:
multiply_list
=============
- given input arrays 'nums1' and 'nums2'
- create a new array 'products'
- for each index in nums1, append the number at that index of nums1 * the number
  at that index of nums2 to products
- return products
=end

def multiply_list(nums1, nums2)
  products = []
  nums1.each_index { |idx| products.push(nums1[idx] * nums2[idx]) }
  products
end

p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]
