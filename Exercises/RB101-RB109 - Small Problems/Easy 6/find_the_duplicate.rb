=begin
Given an unordered array and the information that exactly one value in the array
occurs twice (every other vlaue occurs exactly once), how would you determine
which value occurs twice? Write a method that will find and return the duplicate
value that is known to be in the array.

input: array
output: integer

explicit rules:
- input will only have a single duplicate value
implicit rules:
- does not need to handle improper inputs

data structure:
- array as input
- new array as unique copy of input array
- integer as output

algorithm:
find_dup
========
- given input array 'arr'
- create a new variable 'arr_uniq' that has arr with all duplicate values
  removed
- check the value of each index in both arrays, when the value is different at
  the same index return the value at the original array.
=end

def find_dup(arr)
  arr_uniq = arr.uniq
  arr.each_index { |idx| return arr[idx] if arr[idx] != arr_uniq[idx] }
end

puts find_dup([1, 5, 3, 1]) == 1

puts find_dup([18,  9, 36, 96, 31, 19, 54, 75, 42, 15,
          38, 25, 97, 92, 46, 69, 91, 59, 53, 27,
          14, 61, 90, 81,  8, 63, 95, 99, 30, 65,
          78, 76, 48, 16, 93, 77, 52, 49, 37, 29,
          89, 10, 84,  1, 47, 68, 12, 33, 86, 60,
          41, 44, 83, 35, 94, 73, 98,  3, 64, 82,
          55, 79, 80, 21, 39, 72, 13, 50,  6, 70,
          85, 87, 51, 17, 66, 20, 28, 26,  2, 22,
          40, 23, 71, 62, 73, 32, 43, 24,  4, 56,
          7,  34, 57, 74, 45, 11, 88, 67,  5, 58]) == 73
