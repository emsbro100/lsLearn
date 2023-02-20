def move(n, from_array, to_array)
  to_array << from_array.shift
  move(n - 1, from_array, to_array) if n > 1
end

# Example

todo = ['study', 'walk the dog', 'coffee with Tom']
done = ['apply sunscreen', 'go to the beach']

move(2, todo, done)

p todo # should be: ['coffee with Tom']
p done # should be: ['apply sunscreen', 'go to the beach', 'study', 'walk the dog']

# The SystemStackError is raised because every time move() is called, it always
# calls itself.
# This is fixed by adding a condition to it being called, so that it properly
# stops after n iterations.
