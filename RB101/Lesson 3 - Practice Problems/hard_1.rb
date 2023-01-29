# Question 1
# It will raise an error because greeting is never initialized since the if
# statement evaluates to false.
# Correction: variables initiated within an if clause will still be initiated
# to nil if the branch isn't evaluated, so it returns nil.

# Question 2
# :a => "hi there"
# This is because informal greeting references the original object, and when it
# is modified it is mutated instead of reassigned.

# Question 3
# A) one is: one
#    two is: two
#    three is: three
# B) one is: one
#    two is: two
#    three is: three
# C) one is: two
#    two is: three
#    three is: one

# Question 4
def is_an_ip_number?(number)
  if number =~ /\D/ || !number.to_i.between?(0, 255)
    return false
  end
  true
end

def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  return false if dot_separated_words.size != 4

  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    return false unless is_an_ip_number?(word)
  end

  true
end

dot_separated_ip_address?("192.168.1.1")
dot_separated_ip_address?("192.168.1.1.1")
dot_separated_ip_address?("192.168.1.300")
dot_separated_ip_address?("192.168.1")
dot_separated_ip_address?("192.168.1. ")
