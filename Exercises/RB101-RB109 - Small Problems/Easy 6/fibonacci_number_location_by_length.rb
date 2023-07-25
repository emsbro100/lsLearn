=begin
Write a method that calculates and returns the index of the first Fibonacci
number that has the number of digits specified as an argument.
(The first Fibonacci number has index 1.)

input: int
output: int

explicit rules:
- index of the sequence starts at 1, not 0
- the argument is always greater than or equal to 2
implicit rules:
- does not need to handle improper inputs

data structure:
- use integers to store current and previous values as well as index (no arrays)
- use an integer as the output

algorithm:
find_fibonacci_index_by_length
==============================
- given input integer 'size'
- use three integer variables:
  - previous (begins at 0)
  - current (begins at 1)
  - index (begins at 1)
- until the length of the current number >= 'size',
  set current to previous+current, and previous to current *simultaneously*,
  and increase index by 1
=end

def find_fibonacci_index_by_length(size)
  previous = 0
  current = 1
  index = 1

  while current.to_s.length < size
    current, previous = current + previous, current
    index += 1
  end

  index
end

puts find_fibonacci_index_by_length(2) == 7     # 1 1 2 3 5 8 13
puts find_fibonacci_index_by_length(3) == 12    # 1 1 2 3 5 8 13 21 34 55 89 144
puts find_fibonacci_index_by_length(10) == 45
puts find_fibonacci_index_by_length(100) == 476
puts find_fibonacci_index_by_length(1000) == 4782
puts find_fibonacci_index_by_length(10000) == 47847
