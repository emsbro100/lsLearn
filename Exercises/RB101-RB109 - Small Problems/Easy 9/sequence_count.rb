=begin
Create a method that takes two integers as arguments. The first argument is a
count, and the second is hte first number of a sequence that your method will
create. The mehtod should return an Array that contains the same number of
elements as the count argument, while the values of each element will be
multiples of the starting number.

input: int, int
output: array of integers

rules:
- the count argument will always have a value of 0 or greater
- the starting number can be any integer
- if the count is 0, an empty array should be returned

data structure:
- integers as inputs
- array as output

algorithm:
sequence
========
- given input integers 'count' and 'start'
- create a new array 'numbers'
- for each number from 1 to the count (none if the count is 0) (n):
  - add start * n to numbers
- return numbers
=end

def sequence(count, start)
  numbers = []
  1.upto(count) { |n| numbers.push(start * n) }
  numbers
end

p sequence(5, 1) == [1, 2, 3, 4, 5]
p sequence(4, -7) == [-7, -14, -21, -28]
p sequence(3, 0) == [0, 0, 0]
p sequence(0, 1000000) == []
