=begin
Write a method that takes one argument, a positive integer, and returns the sum
of its digits.

input: int
output: int

rules:
- input will always be an integer

data structure:
- integer as input
- integer as output

algorithm:
sum
===
- given input integer 'num'
- convert num to a string, split by characters, then convert each char to an int
- sum all integers and return the sum
=end

def sum(num)
  num.to_s.chars.map(&:to_i).reduce(:+)
end

puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45
