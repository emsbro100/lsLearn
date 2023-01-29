# Question 1
# a and c will have the same object id, b will not.

# Question 2
# They will all have the same object id because numbers are immutable.

# Question 3
# "My string looks like this now: pumpkins"
# "My array looks like this now: ["pumpkins", "rutabaga"]"
# This happens because the reassignment operator (+=) is non-mutating, while the
# bit shift operator (<<) is mutating.

# Question 4
# "My string looks like this now: pumpkinsrutabaga"
# "My array looks like this now: ["pumpkins"]"

# Question 5
def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param += ["rutabaga"]
  return a_string_param, an_array_param
end

my_string = "pumpkins"
my_array = ["pumpkins"]

my_string, my_array = tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

# Question 6
def color_valid(color)
  color == "blue" || color == "green"
end
