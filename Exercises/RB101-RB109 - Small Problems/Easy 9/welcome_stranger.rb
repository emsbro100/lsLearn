=begin
Create a method that takes 2 arguments, an array and a hash. The array will
contain 2 or more elements that, when combined with adjoining spaces, will
produce a person's name. The hash will contain two keys, :title and :occupation,
and the appropriate values. Your method should return a greeting that uses the
person's full name, and mentions the person's title and occupation.

input: array, hash
output: string

rules:
- input array can have a varying amount of elements
- input containers will online contain string values

data structure:
- array and hash as inputs
- string as output

algorithm:
greetings
=========
- given input array 'name' and hash 'job' with two keys :title and :occupation
- create a new string 'full_name', set it to the result of joining all elements
  of name by spaces
- use string interpolation to add input data to the following string:
  "Hello, [name]! Nice to have a [title] [occupation] around."
- return the string
=end

def greetings(name, job)
  full_name = name.join(' ')
  greeting = "Hello, #{full_name}! Nice to have a #{job[:title]} "\
             "#{job[:occupation]} around."
end

p greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
# => "Hello, John Q Doe! Nice to have a Master Plumber around."
