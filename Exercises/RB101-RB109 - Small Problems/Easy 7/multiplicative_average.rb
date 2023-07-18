=begin
Write a method that takes an Array of integers as input, multiplies all the
numbers together, divides the result by the number of entries in the Array, and
then prints the result rounded to 3 decimal places. Assume the array is
non-empty.

input: array of integers
output: float

rules:
- must print output value to console instead of returning it
- must be a float
- does not need to handle improper inputs
- input array will be non-empty

data structure:
- array as input
- float as output

algorithm:
show_multiplicative_average
===========================
- given input array 'numbers'
- create new float 'average' with the value 1.0
- for each number in numbers
  - multiply average by number
- divide average by the size of numbers
- round average to 3 decimal places
- return average
=end

def show_multiplicative_average(numbers)
  average = 1.0
  numbers.each { |num| average *= num }
  average /= numbers.size
  puts (average * 1000).round.to_f / 1000
end

show_multiplicative_average([3, 5])                # => The result is 7.500
show_multiplicative_average([6])                   # => The result is 6.000
show_multiplicative_average([2, 5, 7, 11, 13, 17]) # => The result is 28361.667
