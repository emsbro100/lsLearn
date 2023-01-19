def digit_product(str_num)
  digits = str_num.chars.map { |n| n.to_i }
  product = 1

  digits.each do |digit|
    product *= digit
  end

  product
end


p digit_product('12345')
# expected return value: 120
# actual return value: 0

# The problem with this code is starting product at 0 instead of 1.
# Because it is at 0, every time it is multiplied by zero again which results
# in the stuck zero value.
# As mentioned at the start, this can be easily fixed by changing product's
# starting value to 1.