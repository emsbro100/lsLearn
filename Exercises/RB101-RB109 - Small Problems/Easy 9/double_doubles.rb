=begin
Write a method that returns 2 times the number provided as an argument, unless
the argument is a double number; double numbers should be returned as-is.

input: int
output: int

rules:
- if a number is a double return it, otherwise return it * 2
- input will be an integer

data structure:
- int as input
- int as output

algorithm:
is_double?
==========
- given input int 'num'
- convert num to a string
- split num into two halves, compare the halves, return the comparison output

twice
=====
- given input int 'num'
- if num returns true from is_double?
  - return num
- else
  - return num * 2
=end

def is_double?(num)
  num_str = num.to_s
  first_half = num_str[0...num_str.size / 2]
  second_half = num_str[num_str.size / 2..]
  first_half == second_half
end

def twice(num)
  if is_double?(num)
    num
  else
    num * 2
  end
end

p twice(37) == 74
p twice(44) == 44
p twice(334433) == 668866
p twice(444) == 888
p twice(107) == 214
p twice(103103) == 103103
p twice(3333) == 3333
p twice(7676) == 7676
p twice(123_456_789_123_456_789) == 123_456_789_123_456_789
p twice(5) == 10
