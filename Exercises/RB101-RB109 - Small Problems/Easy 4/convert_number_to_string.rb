=begin
Write a method that takes a positive integer or zero, and converts it to a string representation.

input: integer
output: string

explicit rules:
- don't use any standard conversion method
- must work for 0
- doesn't need to handle negative numbers or signed numbers

data structure:
- positive or zero integer as input
- string as output
- use a string to store numbers
- use a hash for integer to string

algorithm:
- given integer as input
- for each digit of integer
- use hash to convert that integer to string then concat to end string
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

p integer_to_string(521)
