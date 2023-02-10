adjectives = %w(quick lazy sleepy ugly)
nouns = %w(fox dog head leg)
verbs = %w(jumps lifts bites licks)
adverbs = %w(easily lazily noisly excitedly)

WORDS_DICT = { "adjective" => adjectives,
               "noun" => nouns,
               "verb" => verbs,
               "adverb" => adverbs }

madlibs = File.new("madlibs.txt", 'r')
IO.readlines(madlibs).each do |line|
  line_new = line.gsub(/%\{.{4,9}\}/) { |match| (WORDS_DICT[match[2..-2]]).sample }
  puts line_new
end
