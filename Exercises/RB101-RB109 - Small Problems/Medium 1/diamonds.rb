# Use a loop for rows
# Create an string for the size of the current row ('*' * size)
# Use String#center to make row the proper width with space
# End product will be in a num x num grid

# To calculate number of asterisks, use: num - ( ((num / 2 + 1) - line).abs * 2)
# Lines should not be zero-indexed
# Algorithm tests:
# NUM | LINE | OUT
# 9   | 1    | 1
# 9   | 2    | 3
# 9   | 4    | 7
# 9   | 5    | 9
# 9   | 9    | 1

#num will always be odd
def diamond(num)
  (1..num).each do |line|
    stars = '*' * (num - (((num / 2 + 1) - line).abs * 2))
    puts stars.center(num)
  end
end

def diamond_oneline(num)
  (1..num).each { |line| puts ('*' * (num - (((num / 2 + 1) - line).abs * 2))).center(num)}
end

def diamond_hollow(num)
  (1..num).each do |line|
    starsnum = (num - (((num / 2 + 1) - line).abs * 2))
    stars = (starsnum > 2) ? ('*' + (' ' * (starsnum - 2)) + '*') : '*'
    puts stars.center(num)
  end
end

diamond(5)
diamond_oneline(3)
diamond_hollow(9)
