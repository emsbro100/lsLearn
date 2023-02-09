def palindrome?(string)
  (string.length / 2).times do |num| 
    return false if string[num] != string[-(num + 1)]
  end
  true
end

puts palindrome?('madam') == true
puts palindrome?('Madam') == false          # (case matters)
puts palindrome?("madam i'm adam") == false # (all characters matter)
puts palindrome?('356653') == true
