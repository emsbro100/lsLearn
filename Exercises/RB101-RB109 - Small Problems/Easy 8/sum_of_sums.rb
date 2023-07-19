=begin
Write a method that takes an Array of numbers and then returns the sum of the
sums of each leading subsequence for that Array. You may assume that the Array
always contians at least one number.

input: array
output: integer

rules:
- array will always contain at least one number
- does not need to handle improper inputs

data structure:
- array as input
- integer as output

algorithm:
sum_of_sums
===========
- given input array 'nums'
- create new integer 'sum'
- from 1 to the size of nums (n):
  - slice a subarray from index 0 with size n
  - add all of those elements to sum
- return sum
=end

def sum_of_sums(nums)
  sum = 0
  (1..nums.size).each do |n|
    subarr = nums.slice(0, n)
    sum += subarr.reduce(:+)
  end
  sum
end

p sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
p sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
p sum_of_sums([4]) == 4
p sum_of_sums([1, 2, 3, 4, 5]) == 35
