#use File.open("file directory", "r") for readonly
PATHS = [
  ".",
]

def append_to_directory(dir)
  if dir[-1] == '/'
    dir + '*'
  elsif dir[-1] == '*'
    dir
  else
    dir + '/*'
  end
end

def valid_file?(file, filetypes)
  filetypes.include?(file.split('.').last)
end

def find_files(path, filetypes, recursive)
  if recursive
    find_files_recursive(path, filetypes)
  else
    find_files_nonrecursive(path, filetypes)
  end
end

def find_files_nonrecursive(path, filetypes)
  path = append_to_directory(path)
  files = []

  Dir[path].each do |item|
    files.push(item) if valid_file?(item, filetypes)
  end

  files
end

def find_files_recursive(path, filetypes)
  path = append_to_directory(path)
  files = []

  Dir[path].each do |item|
    if File.directory?(item)
      files.concat(find_files_recursive(item, filetypes))

    elsif valid_file?(item, filetypes)
      files.push(item)
    end
  end

  files
end

def make_regex(term, wildcard=false, case_sensitive=false)
  if case_sensitive
    Regexp.new(wildcard ? term : "\\b#{term}\\b")
  else
    Regexp.new(wildcard ? term : "\\b#{term}\\b", Regexp::IGNORECASE)
  end
end

def search_matches(regex, line)
  line_encoded = line.encode('UTF-8', 'UTF-8', :invalid => :replace)
  line_encoded.scan(regex).size
end

def search_for_term(term, path, wildcard=false, case_sensitive=false, recursive=false, filetypes=['txt'])
  regex = make_regex(term, wildcard, case_sensitive) if !term.is_a?(Regexp)
  files = find_files(path, filetypes, recursive)

  matches = {}

  files.each do |file|
    matchcount = 0

    current_file = File.open(file, "r")
    basename = File.basename(current_file)
    
    IO.readlines(file).each { |line| matchcount += search_matches(regex, line) }
    
    matches[basename] = {}
    matches[basename][:matches] = matchcount
    matches[basename][:path] = File.expand_path(current_file.path)
  end

  matches
end


def search_all_paths(term, wildcard=false, case_sensitive=false, recursive=false, filetypes=['txt'])
  matches = {}

  PATHS.each { |path| matches.merge!(search_for_term(term, path, wildcard, case_sensitive, recursive, filetypes)) }
  
  matches
end

def sort_by_matches(hash)
  hash_copy = hash.clone
  new_hash = {}

  loop do
    largest = ["", { matches: -1, path: "" }]

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

def print_results(hash, paths=false) # Prints results to console nicely
  counter = 0

  hash.each do |key, value|
    next if value[:matches] < 1

    puts paths ? "> #{key}" : "> #{key} (#{value[:path]})"
    puts "Matches: #{value[:matches]}"

    counter += 1
    break if counter > 5
  end
end

def search_single(term, wildcard=false, case_sensitive=false, recursive=false, path='.', paths=true, filetypes=['txt'])
  puts "=> Results for search term: #{term}"
  if path == 'ALL'
    result = search_all_paths(term, wildcard, case_sensitive, recursive, filetypes)
  else
    result = search_for_term(term, path, wildcard, case_sensitive, recursive, filetypes)
  end
  print_results(sort_by_matches(result), paths)
end

# -- COMMAND FORMAT --
# search (--full-word) (-f) ["string" | /regexp/] [path] 
#   Searches for text within files throughout a given folder or folders.
#   arguments: search expression (string or regex), path (ALL or specified)
#   flags: full-word, case-sensitive, recursive, paths, max-results, min-matches
#   optional arguments: --filetypes txt json yml
#                       --results 10
#                       --min 3 (matches)
# help (command)
#   Displays information regarding a specific portion of the program.
#   arguments: commands, [command]

def valid_command?(command)
  command_split = command.split(' ')
  command = command_split.shift
  short_flags = ''
  long_flags = []
  args = []

  2.times { args.push(command_split.pop) }
  

  p command
  p args

end

def interpret(command)

end

def process(command)

end

def search(params)

end

def help(params)

end


#search_single(term="shadow", wildcard=true, case_sensitive=false, recursive=true, path='ALL', paths=false, filetypes=['txt'])

puts "Would you like to search using a phrase or a regex?"
puts "(1) Phrase (2) Regex"
type = gets.chomp == '1' ? "phrase" : "regex"

puts "What term would you like to search for?"
query = gets.chomp
query = Regexp.new(query) if type == "regex"

search_single(query, true, false, true, 'ALL', false, ['txt'])

# improve print results and rest of program to print search term, and to print multiple terms for a search-multiple with hits for each

# need to put args in program loop so methods override default valvues each loop so that each method has minimal args (2-3 max)

# CREATE PROGRAM LOOP THAT TAKES COMMANDS, HAS AN INTERPRETER FOR FOLLOWING COMMANDS:
# search -args WITH ARGS,
# search-multiple -args WITH ARGS,
# quit
# add help command and help [command] commands to show info on commands and arguments/how to use

# move search_single's functionality to main program loop for search -args
# add functionality to store recent search's results and have the ability to open a recent search's file by filename

# default to displaying top 5 results, optional show all argument or --show-all flag to show all results (excluding 0 match results)
# at the bottom include: files searched, lines searched, files with matches, files skipped, and time elapsed
# "found x matches in x files/x lines. (x seconds elapsed)"
# "x files were skipped."
