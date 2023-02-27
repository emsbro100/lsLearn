=begin
Write a method that takes a signed integer or zero, and converts it to a string representation.

input: integer
output: string

explicit rules:
- can use integer_to_string from previous lesson
- must handle negative and positive integers
- return string must have a + at the front if positive

data structure:
- signed integer as input
- signed integer as string as output
- use a boolean to store whether int is negative

algorithm:
- given integer as input
- if abs of integer != integer, negative = true
- run integer_to_string on |integer|, then add proper sign to the front and return
=end

def integer_to_string(number)
  numbers = { 1 => '1', 2 => '2', 3 => '3', 4 => '4', 5 => '5',
              6 => '6', 7 => '7', 8 => '8', 9 => '9', 0 => '0' }
  string_number = ''
  
  number.digits.each do |digit|
    string_number = numbers[digit] + string_number
  end

  string_number
end

def signed_integer_to_string(number)
  negative = number.abs != number
  str_num = integer_to_string(number.abs)

  return str_num if number == 0

  if negative
    '-' + str_num
  else
    '+' + str_num
  end
end

p signed_integer_to_string(4321) == '+4321'
p signed_integer_to_string(-123) == '-123'
p signed_integer_to_string(0) == '0'
