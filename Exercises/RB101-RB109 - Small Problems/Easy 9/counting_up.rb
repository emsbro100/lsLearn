=begin
Write a method that takes an integer argument, and returns an Array of all
integers, in sequence, between 1 and the argument.

input: int
output: arr

rules:
- input will always be an integer >0
- output should be an array of integers

data structure:
- int as input
- array as output

algorithm:
sequence
========
- given input int 'num'
- for each number from 1 to num, add the number to a new array 'numbers'
- return numbers
=end

def sequence(num)
  (1..num).to_a
end

p sequence(5) == [1, 2, 3, 4, 5]
p sequence(3) == [1, 2, 3]
p sequence(1) == [1]
