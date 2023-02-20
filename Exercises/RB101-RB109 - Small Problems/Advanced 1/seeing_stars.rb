# Create lists for coordinates of each line [[x, y], [x, y]]
# Merge/sort lists to be per row [[x, 0], [x, 0]] or just [x, x, x]
# Have a print method that goes through each row and depending on whether each
# index of the current string has a star or not, either concats a star or space

# Find midpoint

# Zero index the coordinate plane

def get_lines(size)
  lines = [
    {start: {x: 0, y: size/2}, end: {x: size-1, y: size/2}}, # Horizontal line
    {start: {x: size/2, y: 0}, end: {x: size/2, y: size-1}}, # Vertical line
    {start: {x: 0, y: 0}, end: {x: size-1, y: size-1}}, # slope = 1
    {start: {x: 0, y: size-1}, end: {x: size - 1, y: 0}} # slope = -1
  ]
end

def get_slope(line)
  y_result = line[:end][:y] - line[:start][:y]
  x_result = line[:end][:x] - line[:start][:x]
  if x_result == 0
    0
  else
    y_result / x_result
  end
end

def midpoint(slope, interval, intercept)
  x = interval
  y = (slope * interval) + intercept
  [x, y]
end

def print_row(points, size)
  row = ""
  size.times { |idx| row << (points.include?(idx) ? '*' : ' ') }
  puts row
end

def star(size)
  coordinates = []
  rows_coordinates = Array.new(size) {[]}

  lines = get_lines(size)

  lines.each do |line|
    slope = get_slope(line)
    intercept = line[:start][:y] - (line[:start][:x] * slope)

    size.times do |interval|
      point = midpoint(slope, interval, intercept)
      coordinates.push((slope == 0 && intercept != size / 2) ? [line[:start][:x], point[0]] : point)
    end
  end

  coordinates.each { |pair| rows_coordinates[pair[0]].push(pair[1]) }
  rows_coordinates.each { |row| print_row(row, size) }
end

star(11)
