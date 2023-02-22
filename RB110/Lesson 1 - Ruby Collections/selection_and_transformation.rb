def general_select(hash, selection_criteria)
  counter = 0
  keys = hash.keys
  
  selected_objs = {}

  loop do
    current_key = keys[counter]
    current_value = hash[current_key]

    if current_value == selection_criteria
      selected_objs[current_key] = current_value
    end

    counter += 1
    break if counter >= keys.size
  end

  selected_objs
end

produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

p general_select(produce, 'Fruit')

def multiply(numbers, multiplier)
  counter = 0

  loop do
    break if counter == numbers.size

    current_number = numbers[counter]
    numbers[counter] = current_number * multiplier

    counter += 1
  end

  numbers
end

my_numbers = [1, 4, 3, 7, 2, 6]
p multiply(my_numbers, 3)

def double_odd_numbers(numbers)
  doubled_numbers = []
  counter = 0

  loop do
    break if counter == numbers.size

    current_number = numbers[counter]
    current_number *= 2 if counter.odd?
    doubled_numbers << current_number

    counter += 1
  end

  doubled_numbers
end

my_numbers = [1, 4, 3, 7, 2, 6]
p double_odd_numbers(my_numbers)  # => [2, 4, 6, 14, 2, 6]

