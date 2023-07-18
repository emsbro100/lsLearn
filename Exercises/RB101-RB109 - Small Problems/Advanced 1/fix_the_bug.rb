=begin
The following code:

def my_method(array)
  if array.empty?
    []
  elsif
    array.map do |value|
      value * value
    end
  else
    [7 * array.first]
  end
end

p my_method([])
p my_method([3])
p my_method([3, 4])
p my_method([5, 6, 7])

is expected to print:

[]
[21]
[9, 16]
[25, 36, 49]

However, it does not. Obviously, there is a bug. Find and fix the bug, then explain why the buggy program printed the results it did.
=end

def my_method(array)
  if array.empty?
    []
  elsif array.size > 1 # Fixed line
    array.map do |value|
      value * value
    end
  else
    [7 * array.first]
  end
end

p my_method([])
p my_method([3])
p my_method([3, 4])
p my_method([5, 6, 7])

# The bug was that the code was meant to check if the array had a multiple
# elements, and if it did, it was supposed to return every element squared.
# However, the original programmer forgot to finish writing the check for that
# (the if statement beside 'Fixed line') so there was an empty elsif. This
# caused the method to return nil if it ever progressed past the first if.
