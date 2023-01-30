#use File.open("file directory", "r") for readonly
PATHS = [
  "*",
  "../Downloads/*"
]

def search_for_term(term, path, wildcard=false, filetypes=['txt'])
  unless wildcard || term.is_a?(Regexp)
    term = " #{term} "
  end
  matches = {}
  files = Dir[path]
  files.each do |file|
    if filetypes.include?(file.split('.').last)
      matchcount = 0
      current_file = File.open(file, 'r')
      IO.readlines(file).each { |line| matchcount += line.scan(Regexp.new(term)).size }
      basename = File.basename(current_file)
      matches[basename] = {}
      matches[basename][:matches] = matchcount
      matches[basename][:path] = File.expand_path(current_file.path)
    end
  end
  matches
end

def search_all_paths(term, wildcard=false, filetypes=['txt'])
  matches = {}
  PATHS.each { |path| matches.merge!(search_for_term(term, path, wildcard, filetypes)) }
  matches
end

def sort_by_matches(hash)
  hash_copy = hash.clone
  new_hash = {}
  loop do
    largest = ["", { matches: -1, path: "PLACEHOLDER" }]
    hash_copy.each do |key, value|
      if value[:matches] > largest[1][:matches]
        largest[0], largest[1] = key, value
      end
    end
    new_hash[largest[0]] = largest[1]
    hash_copy.delete(largest[0])
    break if hash_copy.size < 1
  end
  new_hash
end

def print_results(hash, sorted=true, paths=false) # Prints results to console nicely
  if sorted
    new_hash = sort_by_matches(hash)
  else
    new_hash = hash
  end
  new_hash.each do |key, value|
    if paths
      puts "> #{key} (#{value[:path]})"
    else
      puts "> #{key}"
    end
    puts "Matches: #{value[:matches]}"
  end
end

def search_single(term, wildcard=false, path="ALL", paths=false, filetypes=['txt'], sorted=true)
  puts "=> Results for search term: #{term}"
  if path == "ALL"
    result = search_all_paths(term, wildcard, filetypes)
  else
    result = search_for_term(term, path, wildcard, filetypes)
  end
  print_results(result, sorted, paths)
end

search_single("do", true)

# add case sensitivity option
# HIGH PRIORITY: ADD RECURSIVE OPTION!
# improve print results and rest of program to print search term, and to print multiple terms for a search-multiple with hits for each

# CREATE PROGRAM LOOP THAT TAKES COMMANDS, HAS AN INTERPRETER FOR FOLLOWING COMMANDS:
# search -args WITH ARGS,
# search-multiple -args WITH ARGS,
# quit
# add help command and help [command] commands to show info on commands and arguments/how to use

# maybe include search_single's functionality in main program loop for search -args
# add functionality to store recent search's results and have the ability to open a recent search's file by filename
