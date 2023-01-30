numbers = []
operations = {
  "+" => :+,
  "-" => :-,
  "*" => :*,
  "/" => :/,
  "%" => :%,
  "**" => :**
}

puts("=> Enter the first number:")
numbers.push(gets.chomp.to_i)
puts("=> Enter the second number:")
numbers.push(gets.chomp.to_i)

operations.each do |key, value|
  puts("=> #{numbers[0]} #{key} #{numbers[1]} = #{numbers.reduce(value)}")
end
