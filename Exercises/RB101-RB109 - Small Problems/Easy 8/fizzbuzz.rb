=begin
Write a method that takes two arguments: the first is the starting number, and
the second is the ending number. Print out all numbers from the starting number
to the ending number, except if a number is divisible by 3, print "Fizz", if a
number is divisible by 5, print "Buzz", and finally is a number is divisible by
3 and 5, print "FizzBuzz".

input: int, int
output: integer/string

rules:
- outputs should be printed, not returned

data structure:
- integers as inputs

algorithm:
fizzbuzz
========
- given input integers 'start' and 'stop'
- for each number from start to end:
  - if the number is divisible by 3 and 5:
    - print 'FizzBuzz'
  - else if the number is divisible by 5:
    - print 'Buzz'
  - else if the number is divisible by 3:
    - print 'Fizz'
  - else print the number
=end

def fizzbuzz(start, stop)
  (start..stop).each do |num|
    if num % 3 == 0 && num % 5 == 0 then puts 'FizzBuzz'
    elsif num % 5 == 0 then puts 'Buzz'
    elsif num % 3 == 0 then puts 'Fizz'
    else puts num
    end
  end
end

fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz
