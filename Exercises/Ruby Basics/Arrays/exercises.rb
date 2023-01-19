# 1. New Pet
pets = ['cat', 'dog', 'fish', 'lizard']
my_pet = pets[2]
puts "I have a pet #{my_pet}!"

# 2. More Than One
pets = ['cat', 'dog', 'fish', 'lizard']
my_pets = pets[2..3]
puts "I have a pet #{my_pets[0]} and a pet #{my_pets[1]}!"

# 3. Free the Lizard
pets = ['cat', 'dog', 'fish', 'lizard']
my_pets = pets[2..3]
my_pets.pop
puts "I have a pet #{my_pets[0]}!"

# 4. One Isn't Enough
pets = ['cat', 'dog', 'fish', 'lizard']
my_pets = pets[2..3]
my_pets.pop
my_pets.push(pets[1])
puts "I have a pet #{my_pets[0]} and a pet #{my_pets[1]}!"

# 5. What Color Are You?
colors = ['red', 'yellow', 'purple', 'green']
colors.each { |color| puts "I'm the color #{color}!" }

# 6. Doubled
numbers = [1, 2, 3, 4, 5]
doubled_numbers = numbers.map { |number| number * 2 }
p doubled_numbers

# 7. Divisible by Three
numbers = [5, 9, 21, 26, 39]
divisible_by_three = numbers.select { |number| number % 3 == 0 }
p divisible_by_three

# 8. Favorite Number (Part 1)
[['Dave', 7], ['Miranda', 3], ['Jason', 11]]

# 9. Favorite Number (Part 2)
favorites = [['Dave', 7], ['Miranda', 3], ['Jason', 11]]
p favorites.flatten

# 10. Are We The Same?
array1 = [1, 5, 9]
array2 = [1, 9, 5]
puts array1 == array2