=begin
Write a method that takes any year greater than 0 as input, and returns true if
the year is a leap year, or false if it is not a leap year.

input: integer
output: boolean

explicit rules:
- Year will be > 0

data structure:
- input is an integer
- output is a boolean
- use integers to check calculations within method

algorithm:
- given the argument `year`
- if year is divisible by 4:
    return true unless year is divisible by 100 but not 400
- else return false
=end

def leap_year?(year)
  if year % 4 == 0
    return true unless (year % 100 == 0) && !(year % 400 == 0)
  end
  false
end

p leap_year?(2016) == true
p leap_year?(2015) == false
p leap_year?(2100) == false
p leap_year?(2400) == true
p leap_year?(240000) == true
p leap_year?(240001) == false
p leap_year?(2000) == true
p leap_year?(1900) == false
p leap_year?(1752) == true
p leap_year?(1700) == false
p leap_year?(1) == false
p leap_year?(100) == false
p leap_year?(400) == true
