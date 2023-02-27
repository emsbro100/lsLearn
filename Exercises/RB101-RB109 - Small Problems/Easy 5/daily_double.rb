=begin
Write a method that takes a string argument and returns a new string that
contains the value of the original string with all consecutive duplicate
characters collapsed into a single character.

input: string
output: string

explicit rules:
- may not use String#squeeze or String#Squeeze!
implicit rules:
- should handle single and zero character strings
- should handle all chars including letters and numbers

data structure:
- input is a string
- output is a string
- array as character list

algorithm:
- given input 'chars_string'
- split chars_string into chars[]
- for each char in chars:
    add the char to chars_no_duplicates[] if the last entry is not the same char
- join chars_no_duplicates and return the joined array as a string
=end

def crunch(chars_string)
  chars = chars_string.chars
  chars_no_duplicates = []

  chars.each do |char|
    chars_no_duplicates << char if char != chars_no_duplicates.last
  end

  chars_no_duplicates.join()
end

p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''
