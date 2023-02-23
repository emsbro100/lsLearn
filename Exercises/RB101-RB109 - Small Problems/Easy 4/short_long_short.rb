=begin
P - [Understand the] Problem

E - Examples / Test cases

D - Data Structure

A - Algorithm

C - Code

Write a method that takes two strings as arguments, determines the longest of
the two strings, then returns the result of concatenating the shorter string,
the longer string, and the shorter string once again.

input: string, string
ouput: string

Explicit rules:
- The strings are of different lengths
Implicit rules:
- an empty string will still count as 0-length string.
- Strings won't have whitespace

Data structure:
- Two strings as the input
- One string as the output

Algorithm:
- given two input strings, string1 and string2
- compare the lengths of the different strings
- if string1 is shorter, return string1 + string2 + string1
- else, return string2 + string1 + string2

=end

def short_long_short(string1, string2)
  if string1.size < string2.size
    string1 + string2 + string1
  else
    string2 + string1 + string2
  end
end

p short_long_short('abc', 'defgh') == "abcdefghabc"
p short_long_short('abcde', 'fgh') == "fghabcdefgh"
p short_long_short('', 'xyz') == "xyz"
