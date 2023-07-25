=begin
Write a method that takes a string, and then returns a hash that contains 3
entries: one represents the number of characters in the string that are
lowercase letters, one represents the number of characters that are uppercase
letters, and one represents the number of characters that are neither.

input: string
output: hash

rules:
- should handle non-alphanumeric characters within strings
- should handle empty strings
- does not need to handle improper inputs

data structure:
- string as input
- hash as output
- integers as counters within the hash

algorithm:
letter_case_count
=================
- given input 'str'
- create new hash 'counters' with default values of 0 for lowercase, uppercase,
  and neither
- for each char in str:
  - if char is a lowercase letter (a-z): 
    - increase lowercase counter by 1
  - else if char is an uppercase letter (A-Z):
    - increase uppercase counter by 1
  - else
    - increase neither counter by 1
- return counters
=end

def letter_case_count(str)
  counters = { lowercase: 0, uppercase: 0, neither: 0 }

  str.chars.each do |char|
    if char =~ /[a-z]/
      counters[:lowercase] += 1
    elsif char =~ /[A-Z]/
      counters[:uppercase] += 1
    else
      counters[:neither] += 1
    end
  end

  counters
end

p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }
