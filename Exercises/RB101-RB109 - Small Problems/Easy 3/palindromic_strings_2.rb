def palindrome?(string)
  (string.length / 2).times do |num| 
    return false if string[num] != string[-(num + 1)]
  end
  true
end

def real_palindrome?(string)
  string = string.gsub(/\W/, '').downcase
  palindrome?(string)
end

puts real_palindrome?('madam') == true
puts real_palindrome?('Madam') == true           # (case does not matter)
puts real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
puts real_palindrome?('356653') == true
puts real_palindrome?('356a653') == true
puts real_palindrome?('123ab321') == false
