# Question 1
10.times { |counter| puts (1..counter).collect { ' ' }.join + "The Flintstones Rock!" }
# forgot you could multiply strings haha..

# Question 2
# This is because there is not implicit conversion for integer to string.
# One way to fix it is by using string interpolation, another is by using #to_s.

# Question 3
# Two great options would be to either do a while loop using "while divisor > 0",
# or to use loop do...end with "break if divisor <= 0" at the end.
# B1: It checks if the number divides evenly by the divisor, which makes it a factor.
# B2: The second to last line returns the array of factors.

# Question 4
# The two implementations are different. 
# In the first one, it creates a copy of the array internally, modifies that, 
# and returns the modified array.
# In the second one, it directly modifies the array passed as an argument, and
# returns the same mutated object that was passed as an argument.

# Question 5
# Limit is a local variable, not accessible within the scope of the fib() method.
# It could be fixed by adding limit as a parameter then passing it in as an
# argument when calling the method.

# Question 6
# The output is 34 because answer is equal to 42. new_answer is not printed.

# Question 7
# Yes, because the hash is being directly modified without being copied.

# Question 8
# "paper"

# Question 9
# "no"
