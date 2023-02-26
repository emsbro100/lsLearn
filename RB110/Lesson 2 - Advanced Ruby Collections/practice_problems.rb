# Problem 1
arr = ['10', '11', '9', '7', '8']
arr.sort! { |a, b| b.to_i <=> a.to_i }
arr = arr.sort_by { |n| n.to_i }.reverse

# Problem 2
books = [
  {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
  {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
  {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
  {title: 'Ulysses', author: 'James Joyce', published: '1922'}
]

books.sort_by! { |book| book[:published] }

# Problem 3
arr1 = ['a', 'b', ['c', ['d', 'e', 'f', 'g']]]
arr1[2][1][3]

arr2 = [{first: ['a', 'b', 'c'], second: ['d', 'e', 'f']}, {third: ['g', 'h', 'i']}]
arr2[1][:third][0]

arr3 = [['abc'], ['def'], {third: ['ghi']}]
arr3[2][:third][0][0]

hsh1 = {'a' => ['d', 'e'], 'b' => ['f', 'g'], 'c' => ['h', 'i']}
hsh1['b'][1]

hsh2 = {first: {'d' => 3}, second: {'e' => 2, 'f' => 1}, third: {'g' => 0}}
hsh2[:third].keys[0]

# Problem 4
arr1 = [1, [2, 3], 4]
arr1[1][1] += 1

arr2 = [{a: 1}, {b: 2, c: [7, 6, 5], d: 4}, 3]
arr2[2] += 1

hsh1 = {first: [1, 2, [3]]}
hsh1[:first][2][0] += 1

hsh2 = {['a'] => {a: ['1', :two, 3], b: 4}, 'b' => 5}
hsh2[['a']][:a][2] += 1

# Problem 5
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

ages_sum = munsters.reduce(0) do |sum, (k, v)|
  v['gender'] == 'male' ? sum + v["age"] : sum
end

# Problem 6
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |name, info|
  puts "#{name} is a #{info['age']}-year-old #{info['gender']}."
end

# Problem 7
# a = 2, b = [3, 8]

# Problem 8
hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}
hsh.each_value do |value|
  value.each do |word|
    word.chars.each do |char|
      puts char if char =~ /[aeiou]/
    end
  end
end

# Problem 9
arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]
new_arr = arr.map do |subarr|
  subarr.sort { |a, b| b <=> a }
end

# Problem 10
arr = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]
new_arr = arr.map do |hsh|
  hsh.map { |k, v| [k, v + 1] }.to_h
end

# Problem 11
arr = [[2], [3, 5, 7, 12], [9], [11, 13, 15]]
new_arr = arr.map do |subarr|
  subarr.select { |num| num % 3 == 0 }
end

# Problem 12
arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]
hash = arr.each_with_object({}) { |arr, obj| obj[arr[0]] = arr[1] }

# Problem 13
arr = [[1, 6, 9], [6, 1, 7], [1, 8, 3], [1, 5, 9]]
new_arr = arr.sort_by do |subarr|
  subarr.reject { |num| num % 2 == 0 }
end

# Problem 14
hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

arr = hsh.each_with_object([]) do |(_, v), obj|
  if v[:type] == 'fruit'
    obj << v[:colors].map { |color| color.capitalize }
  elsif v[:type] == 'vegetable'
    obj << v[:size].upcase
  end
end

# Problem 15
arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]
new_arr = arr.select do |hsh|
  hsh.values.all? { |arr| arr.all? { |num| num.even? } }
end

# Problem 16
def rand_hex(size)
  str = ''
  size.times { str << rand(16).to_s(16) }
  str
end

def uuid
  section_sizes = [8, 4, 4, 4, 12]
  sections = []

  section_sizes.each { |size| sections << rand_hex(size) }

  sections.join('-')
end
