require "Date"

def friday_13th(year)
  num = 0

  1.upto(12) do |month|
    num += 1 if Date.new(year, month, 13).friday?
  end
  
  num
end

puts friday_13th(2015) == 3
puts friday_13th(1986) == 1
puts friday_13th(2019) == 2
