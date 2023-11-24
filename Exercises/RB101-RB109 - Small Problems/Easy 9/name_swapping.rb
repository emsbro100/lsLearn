=begin
Write a method that takes a first name, a space, and a last name passed as a
single String argument, and returns a string that contains the last name, a
comma, and the first name.

input: string
output: string

rules:
- input will be a string

data structure:
- string as input
- string as output

algorithm:
swap_name
=========
- given input string 'name'
- split name by space to a new array 'name_parts'
- create a new string 'name_formal' that uses string interpolation to create the
  following string:
  "[name_parts[1]], [name_parts[0]]"
- return name_formal
=end

def swap_name(name)
  name_parts = name.split(' ')
  "#{name_parts[1]}, #{name_parts[0]}"
end

p swap_name('Joe Roberts') == 'Roberts, Joe'
