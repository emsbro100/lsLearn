=begin
Write a method that takes a floating point number that represents an angle
between 0 and 360 degrees adn returns a String that represents that angle in
degrees, minutes and seconds. You should use a degree symbol to represent
degrees, a single quote to represent minutes, and a double quote to represent
seconds.

input: int or float
output: string

explicit rules:
- use two digit numbers with leading zeros when formatting mins/seconds
implicit rules:
- must handle zeroes
- does not need to handle improper inputs
- floating points should be rounded for accuracy rather than dropped

data structure:
- integer or float as an input
- degrees/minutes/seconds formatted string as an output
- use integers to store dms

algorithm:
dms
===
- given input 'degrees'
- convert float to array with integer and floating point (divmod 1)
- set nums_arr to d_to_dms(floating ponts)
- set minutes to nums_arr[0]
- set nums_arr to d_to_dms(nums_arr[1])
- set seconds to nums_arr[0]
- return dms in proper format

d_to_dms
===============
- given input floating point 'value'
- multiply value by 360 and divide by 60
- return an array containing the first two decimal points of that value, and the
  following decimal points
=end

DEGREE = "\xC2\xB0"

def decimal_to_dms(value)
  ((value * 360 / 60) * 10).divmod(1)
end

def zeros(num, zeros)
  "%0#{zeros}d" % num
end

def normalize(value, maximum)
  while value > maximum || value < 0
    if value.abs == value
      value -= maximum
    else
      value += maximum
    end
  end

  value
end

def dms(degrees)
  degrees = normalize(degrees, 360)

  nums_arr = degrees.divmod(1)

  nums_arr = decimal_to_dms(nums_arr[1])
  minutes = nums_arr[0]

  nums_arr = decimal_to_dms(nums_arr[1])
  seconds = nums_arr[0]

  "#{degrees.to_i}#{DEGREE}#{zeros(minutes, 2)}'#{zeros(seconds, 2)}\""
end

puts dms(-359.273)
