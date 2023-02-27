=begin
Write a method that takes one argument, a positive integer, and returns a list
of the digits in the number.

input: integer
output: array

explicit rules:
- takes a positive non-zero integer
implicit rules:
- doesn't need to handle input exceptions

data structure:
- input is a positive non-zero integer
- output is an array of integers

algorithm:
- given input integer 'number'
- declare an empty array 'digits'
- get the size of the number by seeing how many times it can be divided by 10 
  and be >= 1
- for each digit in the number, unshift number / (10.pow(digit)) % 10 to digits
- return digits
=end

def digit_list(number)
  digits = []
  number_clone = number.dup
  number_size = 0

  while number_clone >= 1
    number_size += 1
    number_clone /= 10
  end

  number_size.times do |digit|
    digits.unshift(number / (10.pow(digit)) % 10)
  end

  digits
end

p digit_list(375290)
