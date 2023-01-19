def find_first_nonzero_among(numbers)
  numbers.each do |n|
    return n if n.nonzero?
  end
end

# Examples

find_first_nonzero_among(0, 0, 1, 0, 2, 0)
find_first_nonzero_among(1)

# For the first example it raises an ArgumentError for the incorrect amount of
# arguments. To correct the error the numbers should be given as an array.

# For the second example it raises a NoMethodError. This is because it is 
# given an integer as an argument instead of an array, and Integer doesn't
# have a #each method.