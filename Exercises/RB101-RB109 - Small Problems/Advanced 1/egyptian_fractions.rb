=begin
Write two methods:
- One that takes a rational number as an argument, and returns an Array of the
  denominators that are part of an Egyptian Fraction representation of the
  number
- Another that takes an Array of numbers in the same format, and calculates the
  resulting Rational number.

Second method
-------------
input: array of integers
output: rational number

rules:
- input validation not required

data structure:
- array as input
- rational number as output

algorithm:
unegyptian
==========
- given input array 'fractions'
- create a new variable 'sum' equal to the rational 0/1
- for each num in fractions (n):
  - add the rational 1/n to sum
- return sum

First method
------------
input: rational number
output: array

rules:
- input validation not required

data structure:
- rational number as input
- array as output

algorithm:
egyptian
========
- given input rational number 'fraction'
- create a new array 'fractions'
- create a new variable 'denominator' with the value 1
- while the return of calling unegyptian on fractions is less than fraction:
  - if the return of calling unegyptian on fractions with denominator appended isn't
    greater than fraction:
    - append denominator to fractions
  - increase denominator by 1
- return fractions
=end

def unegyptian(fractions)
  sum = Rational(0, 1)
  fractions.each { |n| sum += Rational(1, n) }
  sum
end

def egyptian(fraction)
  fractions = []
  denominator = 1
  while unegyptian(fractions) < fraction
    fractions.push(denominator) if unegyptian(fractions + [denominator]) <= fraction
    denominator += 1
  end
  fractions
end

p egyptian(Rational(2, 1))    # -> [1, 2, 3, 6]
p egyptian(Rational(137, 60)) # -> [1, 2, 3, 4, 5]
p egyptian(Rational(3, 1))    # -> [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 15, 230, 57960]

p unegyptian(egyptian(Rational(1, 2))) == Rational(1, 2)
p unegyptian(egyptian(Rational(3, 4))) == Rational(3, 4)
p unegyptian(egyptian(Rational(39, 20))) == Rational(39, 20)
p unegyptian(egyptian(Rational(127, 130))) == Rational(127, 130)
p unegyptian(egyptian(Rational(5, 7))) == Rational(5, 7)
p unegyptian(egyptian(Rational(1, 1))) == Rational(1, 1)
p unegyptian(egyptian(Rational(2, 1))) == Rational(2, 1)
p unegyptian(egyptian(Rational(3, 1))) == Rational(3, 1)
