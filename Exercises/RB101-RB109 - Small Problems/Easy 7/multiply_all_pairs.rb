=begin
Write a method that takes two Array arguments in which each Array contains a
list of numbers, and returns a new Array that contains the product of every pair
of numbers that can be formed between the elements of the two Arrays. The
results shoudl be sorted by increasing value.

You may assume that neithera rgument is an empty Array.

input: array, array
output: array

rules:
- neither arugment is empty
- does not need to handle improper inputs
- output array should be sorted by value ascending

data structure:
- arrays as input
- array as output

algorithm:
multiply_all_pairs
==================
- given input arrays 'nums1' and 'nums2'
- create a new array 'products'
- for each number in nums1 (n1):
  - for each number in nums2 (n2):
    - multiply n1 by n2 and append it to products
- sort products by ascending value and return it
=end

def multiply_all_pairs(nums1, nums2)
  products = []
  nums1.each do |n1|
    nums2.each { |n2| products.push(n1 * n2) }
  end
  products.sort
end

p multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]
