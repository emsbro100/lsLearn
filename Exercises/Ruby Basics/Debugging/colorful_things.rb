colors = ['red', 'yellow', 'purple', 'green', 'dark blue', 'turquoise', 'silver', 'black']
things = ['pen', 'mouse pad', 'coffee mug', 'sofa', 'surf board', 'training mat', 'notebook']

colors.shuffle!
things.shuffle!

i = 0
loop do
  break if i >= things.length

  if i == 0
    puts 'I have a ' + colors[i] + ' ' + things[i] + '.'
  else
    puts 'And a ' + colors[i] + ' ' + things[i] + '.'
  end

  i += 1
end

# The error thrown is a TypeError: no implicit conversion of nil into String.
# There are two things causing this problem: one is the fact that colors is one
# index larger than things which results in an out-of-range index call in the
# final iteration, but there is also an off by one error on line 9 which is
# causing another extra iteration out of the range of both arrays.

# The off by one error is fixed by simply changing > to >=.
# One way to fix the other error would be to remove an item from colors or add
# one to things, but better than either of those would be to base the amount of
# loops on the smaller array, which in this case is things.