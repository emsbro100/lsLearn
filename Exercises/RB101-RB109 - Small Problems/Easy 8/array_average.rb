=begin
Write a method that takes oen argument, an array containing integers, and
returns the average of all numbers in the array. The array will never be empty
and the numbers will always be positive integers. Your result shoudl also be an
integer.

input: array of integers
output: integer

rules:
- do not use Array#sum
- output should be an integer:
- use integer division, not float division

data structure:
- array as input
- integer as output

algorithm:
average
=======
- given input array 'numbers'
- create a new integer 'sum' equal to 0
- for each number in numbers:
  - add the number to sum
- divide sum by the number of elements in integers, assign that to new int 'avg'
- return avg
=end

def average(numbers)
  sum = 0
  numbers.each { |num| sum += num }
  avg = sum / numbers.size
end

puts average([1, 6]) == 3 # integer division: (1 + 6) / 2 -> 3
puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40
