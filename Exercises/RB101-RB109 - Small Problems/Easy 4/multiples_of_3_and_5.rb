=begin
Write a method that searches for all multiples of 3 or 5 that lie between 1 and
some other number, and then computes the sum of those multiples.

input: integer
output: integer

explicit rules:
- The number passed in is an integer greater than 1

data structure:
- input: integer > 1
- output: integer
- create arrays of numbers that are multiples
- store the sum of those arrays as an integer

algorithm:
  multisum
  ========
  - given the argument `maximum` as an integer
  - initialize a variable counter as 0
  - set multiples_of_3 to multiples(3, max)
  - set multiples_of_5 to multiples(5, max)
  - merge multiples_of_3 and multiples_of_5 and remove duplicate values
  - add all of the numbers in multiples_of_3 and multiples_of_5 to sum
  - return sum

  multiples
  =========
  - given the arguments `multiple` as an integer and `maximum` as an integer
  - create an empty array multiples
  - initialize a variable `counter` to 0
  - until counter is > maximum, increase counter by multiple and add counter's
    value to multiples
  - return multiples
=end

def multiples(multiple, maximum)
  multiples = []
  counter = 0
  loop do
    multiples << counter
    counter += multiple
    break if counter > maximum
  end
  multiples
end

def multisum(maximum)
  counter = 0
  sum = 0
  
  multiples_of_3 = multiples(3, maximum)
  multiples_of_5 = multiples(5, maximum)
  multiples = (multiples_of_3 + multiples_of_5).uniq

  sum = multiples.reduce(:+)
  sum
end

p multisum(3) == 3
p multisum(5) == 8
p multisum(10) == 33
p multisum(1000) == 234168
