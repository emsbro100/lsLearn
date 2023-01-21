# a method that returns the sum of two integers 
=begin
Take two arguments, each argument must be an integer
  add the two integers and save them to a variable "sum"

Return the sum

START

# Given two arguments, first_num and second_num

SET sum = 0

sum = first_num + second_num

RETURN sum

END
=end


# a method that takes an array of strings, and returns a string that is all
# those strings concatenated together
=begin
Take one argument, array of strings
  create empty variable "strings_concatenated"
  for each string in strings:
    append string to strings_concatenated

Return strings_concatenated

START

# Given one argument, strings

SET strings_concatenated = ""
SET iterator = 0

WHILE iterator < length of strings
    strings_concatenated += strings[iterator]
    iterator += 1

RETURN strings_concatenated

END
=end


# a method that takes an array of integers, and returns a new array with every
# other element from the original array, starting with the first element.
=begin
Take one argument, an array of integers
  iterate through each element in integers
  if the element index is even
    add it to the new array
  otherwise, if its odd
    do nothing and go to the next index

After iterating through the whole array, return the new array

START

# Given one argument, numbers

SET new_array = []
SET index = 0

WHILE index < length of numbers
  IF index is even
    append numbers[index] to new_array
  ELSE
    go to the next iteration

RETURN new_array

END
=end


# a method that determines the index of the 3rd occurence of a given character
# in a string. if the character does not occur at least 3 times, return nil.
=begin
Take two arguments, a string and a character to find the 3rd occurence of within that string
  create a variable "counter" to count occurences of a character
  iterate through each character in string
  if the current character is the given character
    increase counter by 1
    if counter is 3
      Return the current index
  otherwise
    continue iterating through characters of the string

START

# Given two arguments, string and char

SET index = 0
SET counter = 0

WHILE index < length of string
  IF string[index] is equal to char
    counter += 1
    IF counter is equal to 3
      RETURN index
  index += 1

RETURN nil

END
=end


# a method that takes two arrays of numbers and returns the result of merging
# the arrays. the elements in the first array should become the elements at the
# even indexes, while the elements of the seconds array should become the
# elements at the odd indexes.
=begin
Take two arguments, both arrays.
  use three variables, a combined index counter and an index counter for each array
  if the value of the counter is even then read from the first array,
  if its odd then read from the second array
    assign the value of the current array by that array counter's index to the
    combined array by the combined array counters index
    increment both the current array counter and the combined array counter
Return the combined array

START

# Given two arguments, first_array and second_array

SET combined_array = []
SET combined_counter = 0
SET first_counter = 0
SET second_counter = 0

WHILE combined_counter < (length of first_array) + (length of second_array)
  IF combined_counter is even
    combined_array[combined_counter] = first_array[first_counter]
    first_counter += 1
  ELSE
    combined_array[combined_counter] = second_array[second_counter]
    second_counter += 1
  combined_counter += 1

RETURN combined_array

END
=end

def combiner(first_array, second_array) # Needed to test if my pseudocode would work lol
  combined_array = []
  combined_counter = 0
  first_counter = 0
  second_counter = 0
  total_length = first_array.size + second_array.size

  while combined_counter < total_length
    if combined_counter.even?
      combined_array[combined_counter] = first_array[first_counter]
      first_counter += 1
    else
      combined_array[combined_counter] = second_array[second_counter]
      second_counter += 1
    end
    combined_counter += 1
  end
  
  return combined_array
end

p combiner(["a", "b", "c"], [1, 2, 3])