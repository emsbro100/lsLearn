# What will the following code print, and why? Don't run the code until you have
# tried to answer.

array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
array2 = []
array1.each { |value| array2 << value }
array1.each { |value| value.upcase! if value.start_with?('C', 'S') }
puts array2

# Moe
# Larry
# CURLY
# SHEMP
# Harpo
# CHICO
# Groucho
# Zeppo
#
# The reason it prints this is because when it adds each value from array1
# to array2 (on line 6) it isn't copying the value but instead copying the
# object. That's why when objects are mutated on line 7, they are mutated in
# both array1 and array2, because both arrays are storing the same objects, not
# separate copies.
