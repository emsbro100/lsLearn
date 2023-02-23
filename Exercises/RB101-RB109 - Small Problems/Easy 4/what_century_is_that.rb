=begin
Write a method that takes a year as input and returns the century. The return
value should be astring that begins with the century number, and end with `st`,
`nt`, `rd`, or `th` as appropriate for that number.

input: integer (year)
output: string

explicit rules:
- input is a year (positive integer)
- Return value is a string that is the century number followed by the proper suffix.
- new centuries begin in years that end with 01, so 1901-2000 is the 20th century.
implicit rules:
- input is always a non-zero positive integer

data structures:
- input: integer
- output: string
- generate the century as an integer using the input year, then convert to str
- generate the suffix as a string using the century year
- return the combined century and suffix as a string

algorithm:
- to find the century:
    divide year by 100
    add 1 if the last number in year isn't 0
- choose the appropriate suffix depending on the last number in century:
    11-19: 'th'
    1: 'st'
    2: 'nd'
    3: 'rd'
    0, 4-9: 'th'
- return century concatenated with the appropriate suffix
=end

def century(year)
  century = year / 100
  century = year.to_s[-1] == '0' ? century.to_s : (century + 1).to_s

  ending = case
  when century[-2..].to_i > 10 && century[-2..].to_i < 20 then 'th'
  when century[-1] == '1' then 'st'
  when century[-1] == '2' then 'nd'
  when century[-1] == '3' then 'rd'
  else 'th'
  end

  century + ending
end

p century(2000) == '20th'
p century(2001) == '21st'
p century(1965) == '20th'
p century(256) == '3rd'
p century(5) == '1st'
p century(10103) == '102nd'
p century(1052) == '11th'
p century(1127) == '12th'
p century(11201) == '113th'
