=begin
Write two methods that each take a time of day in 24 hour format, and retunr the
number of minutes before and after midnight, respectively.

input: string
output: integer

explicit rules:
- may not use ruby's Date and Time methods
- return value should be in the range 0..1439
implicit rules:
- 24:00 should be read as 00:00
- doesn't need to handle improper inputs

data structure:
- input is a string in 'hh:mm' format
- output is a positive integer

algorithm:

after_midnight
==============
- given input string 'time'
- split string by ':', multiply hours * 60 and add minutes
- if >= 1440, reduce by 1440 until within range
- return the delta value

before_midnight
===============
- given input string 'time'
- split string by ':', multiply hours * 60 and add minutes
- if >= 1440, reduce by 1440 until within range
- return 1440 - the delta value
=end

def after_midnight(time)
  hhmm = time.split(':').map { |str| str.to_i }
  delta = hhmm[0] * 60 + hhmm[1]
  delta -= 1440 until delta <= 1439
  delta
end

def before_midnight(time)
  hhmm = time.split(':').map { |str| str.to_i }
  delta = hhmm[0] * 60 + hhmm[1]
  delta -= 1440 until delta <= 1439
  delta == 0 ? delta : 1440 - delta
end

p after_midnight('00:00') 
p before_midnight('00:00') 
p after_midnight('12:34') 
p before_midnight('12:34') 
p after_midnight('24:00') 
p before_midnight('24:00') 
