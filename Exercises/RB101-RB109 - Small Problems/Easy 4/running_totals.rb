=begin
Write a method that takes an Array of numbers, and returns an ARray with the
same number of elements, and each element has the running total from the
original Array.
A running total is the sum of all values in the list up to and including the
current element. Thus, the running total when looking at index 2 of the array
[14, 11, 7, 15, 20] is 32 (14 + 11 + 7).

input: array
output: array

explicit rules:
- returned array should have the same number of elements
- each element has the running total from the original array
implicit rules:
- array input may be any size from 0 to infinity
- input array contains only integers

data structure:
- input: array of integers
- output: array of integers
- use an integer as the running total counter

algorithm:
- given an array as the argument
- initialize a new empty array, `running_totals`
- for each number in the input array:
    sum all numbers from index 0 to current index
    add that sum to running_totals
- return running_totals
=end

def running_total(array)
  running_totals = []
  sum = 0

  array.each_index do |idx|
    sum = 0
    (idx+1).times do |counter|
      sum += array[counter]
    end
    running_totals << sum
  end

  running_totals
end

p running_total([2, 5, 13])
p running_total([14, 11, 7, 15, 20])
p running_total([3])
p running_total([])
