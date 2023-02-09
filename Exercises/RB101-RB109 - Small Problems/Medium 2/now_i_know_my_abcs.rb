BLOCKS = [
  %w(B O), %w(X K), %w(D Q), %w(C P), %w(N A),
  %w(G T), %w(R E), %w(F S), %w(J W), %w(H U),
  %w(V I), %w(L Y), %w(Z M)
]

def block_word?(word)
  word = word.upcase
  BLOCKS.each do |block| 
    return false if (word.include?(block[0])) && (word.include?(block[1]))
  end
  true
end

puts block_word?('BATCH') == true
puts block_word?('BUTCH') == false
puts block_word?('jest') == true
