# Question 1
# 1
# 2
# 2
# 3

# Question 2
# ! is usually either used as an operator to reverse the truthiness of a value,
# or at the end of a method to indicate that it is destructive.
# ? is usually used either to get a boolean value, or at the end of a method
# to indicate that the method returns a boolean value.
# 1. != means "not equal to", and should be used to check if two values are not 
# equal.
# 2. ! before something will return the opposite of the truthiness of the value.
# for example, !"string" would return false because "string" is truthy.
# 3. ! after something, like words.uniq! indicates that the method it is after
# is destructive, and will mutate the caller.
# 4. ? before something is invalid syntax and will return an error.
# 5. ? after a variable or expression will begin a ternary expression, or after
# a method will indicate the method returns a boolean value.
# 6. !! before something will return the boolean equivalent of the value.

# Question 3
advice = "Few things in life are as important as house training your pet dinosaur."
advice.gsub!(/important/, "urgent")

# Question 4
# The first method call will delete the value at the first index, 2.
# The second method call will delete the value 1. (at the 0 index)

# Question 5
(10..100).include?(42)

# Question 6
famous_words = "seven years ago..."
famous_words.gsub!(/^/, "Four score and ")

famous_words = "seven years ago..."
famous_words = "Four score and " + famous_words

# Question 7
flintstones = ["Fred", "Wilma"]
flintstones << ["Barney", "Betty"]
flintstones << ["BamBam", "Pebbles"]
flintstones.flatten!

# Question 8
flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }
barney = []
flintstones.each { |key, value| barney.push(key, value) if key == "Barney" }
