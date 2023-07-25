=begin
Modify the method from the previous exercise so it ignores non-alphabetic
characters when determining whether it should uppercase or lowercase each
letter. The non-alphabetic characters should still be included in the return
value; they just don't count when toggling the desired case.

input: string
output: string

rules:
- count every other character, including non-letters
- do not modify non-letters
- does not need to handle improper inputs
- should ignore all non-letter chars when determining if it should be upper or
  lowercase
=end

def staggered_case(str)
  chars = str.downcase.chars
  chars.each_with_index do |char, idx|
    next unless char =~ /[a-zA-Z]/
    char.upcase! if idx.even?
  end
  staggered_str = chars.join
end

p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'
