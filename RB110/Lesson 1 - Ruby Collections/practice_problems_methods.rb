# Problem 1
# [1, 2, 3] 
# This is because 'hi' is the last line in the block and is a truthy value.

# Problem 2
# `count` will return a string. It considers the truthiness of the blocks return 
# value. We can find this out by checking the documentation or simply running 
# the code.

# Problem 3
# [1, 2, 3]
# This is because reject will remove the value from the returned array if its
# block returns true, and since puts returns nil every value is kept.

# Problem 4
# {'a'=>'ant','b'=>'bear','c'=>'cat'}
# This is because the return value is a hash and each hash value is the current
# object in the array set to the key of the first char of that object.

# Problem 5
# It removes the first pair from the array, which is :a => 'ant'. We can find
# out by reading the documentation for Hash#shift.

# Problem 6
# 11
# This is because we are chaining the methods #pop and #size on an array, which
# results in #size being called on the popped value, "caterpillar".

# Problem 7
# The block's return value is true or false depending on if the current object
# is an odd number or not. The return value of `any?` is true, and the output
# value is 1.

# Problem 8
# Take returns the first `n` values in the array. It is not destructive. We can
# find this out by reading the documentation for Array#take.

# Problem 9
# [nil, 'bear']
# This is because there is only a return value supplied within the block if the
# `value`'s size is > 3.

# Problem 10
# [1, nil, nil]
# This is because if the number is > 1 then puts is called which returns nil.
