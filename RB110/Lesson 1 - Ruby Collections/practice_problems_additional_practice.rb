# Problem 1
flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

flintstones_hash = flintstones.each_with_object({}) do |item, hash|
  hash[item] = flintstones.find_index(item)
end

flintstones_hash = {}
flintstones.each_with_index { |obj, idx| flintstones_hash[obj] = idx }

# Problem 2
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

ages_sum = ages.values.reduce(:+)

# Problem 3
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

ages.reject! { |name, age| age >= 100 }

# Problem 4
ages.values.min

# Problem 5
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones.bsearch_index { |name| name[0..1] == "Be" }

# Problem 6
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones.map! { |name| name[0, 3] }

# Problem 7
statement = "The Flintstones Rock"
frequency = statement.split('').each_with_object({}) do |char, hash|
  if char =~ /[A-Za-z]/
    hash[char] = hash.include?(char) ? hash[char] + 1 : 1
  end
end

# Problem 8
# Modifying an array during iteration will break the iteration by throwing off
# the index.
# The first code block would output: 1, 3
# The second code block would output: 1, 2

# Problem 9
words = "the flintstones rock"
words = words.split.map { |word| word.capitalize}.join(' ')

# Problem 10
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}
age_groups = { "kid" => (0..17), "adult" => (18..64), "senior" => (65..) }

munsters.each do |name, info|
  age_groups.each do |group, ages|
    munsters[name]['age_group'] = group if ages.include?(info['age'])
  end
end
