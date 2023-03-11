LINE_HORIZONTAL = "\u{2500}"
LINE_VERTICAL = "\u{2502}"
LINE_PLUS = "\u{253c}"

def middle_line
  Array.new(3) { LINE_HORIZONTAL * 3 }.join(LINE_PLUS)
end

def generate_board
  Array.new(3) { Array.new(3) { ' ' } }
end

def display(board)
  Gem.win_platform? ? (system "cls") : (system "clear")

  board.each_index do |line|
    puts middle_line unless line == 0
    puts board[line].map { |char| " #{char} " }.join(LINE_VERTICAL)
  end
end

def position_index(position)
  (position - 1).divmod(3)
end

def position_to_value(board, position)
  index = position_index(position)
  board[index[0]][index[1]]
end

def positions_to_values(board, array)
  new_arr = []
  array.each do |value|
    index = position_index(value)
    new_arr << board[index[0]][index[1]]
  end
  new_arr
end

def empty_positions(board)
  empty = []
  board.each_with_index do |row, y|
    row.each_with_index { |value, x| empty << (y * 3) + x + 1 if value == ' ' }
  end
  empty
end

def update_board!(board, position, char)
  pos_index = position_index(position)
  board[pos_index[0]][pos_index[1]] = char
end

def all_x_or_o?(row)
  row.all?('X') || row.all?('O')
end

def board_lines
  lines = [[1, 5, 9], [3, 5, 7], # Diagonal
           [1, 2, 3], [4, 5, 6], [7, 8, 9], # Horizontal
           [1, 4, 7], [2, 5, 8], [3, 6, 9]] # Vertical
end

def check_board(board)
  lines = board_lines

  lines.each do |line| # Check for winners
    if all_x_or_o?(positions_to_values(board, line))
      return position_to_value(board, line[0])
    end
  end
  return 'TIE' unless board.any? { |row| row.any?(' ') } # Check for tie
  nil # No winner or tie
end

def joinor(arr, delimiter=', ', final_delimiter='or')
  joined_str = arr[0].to_s

  (arr.size - 1).times do |num|
    if arr.size == 2
      joined_str << " #{final_delimiter} "
    elsif num >= arr.size - 2
      joined_str << "#{delimiter}#{final_delimiter} "
    else
      joined_str << delimiter
    end
    joined_str << arr[num + 1].to_s
  end

  joined_str
end

def player_turn(board)
  puts "Please enter the number of the position you want to put an X in:"
  puts "(#{joinor(empty_positions(board))})"
  update_board!(board, get_position(empty_positions(board)), 'X')
end

def find_at_risk_square(board, char)
  lines = board_lines

  lines.each do |line|
    line_values = positions_to_values(board, line)
    if line_values.any?(' ')
      if line_values.count(char) == 2
        return line[line_values.find_index(' ')]
      end
    end
  end

  nil
end

def ai_simple(board)
  empty_positions(board).sample
end

def ai_defensive(board)
  defend_square = find_at_risk_square(board, 'X')
  return defend_square if defend_square

  ai_simple(board)
end

def ai_offensive(board)
  attack_square = find_at_risk_square(board, 'O')
  return attack_square if attack_square

  defend_square = find_at_risk_square(board, 'X')
  return defend_square if defend_square

  return 5 if empty_positions(board).include?(5)

  ai_simple(board)
end

def ai_minimax(board)
  node_tree = generate_nodes(board)
  score = minimax!(node_tree, true)

  node_tree[:subtree].each do |node|
    return node[:choice] if node[:score] == score
  end
end

def clone_board(board)
  Marshal.load(Marshal.dump(board))
end

def generate_nodes(board, choice = nil, depth = 0, user = 'O', user_turn = true)
  tree = { depth: depth, choice: choice, score: nil, subtree: [] }
  positions_arr = empty_positions(board)

  opponent = user == 'O' ? 'X' : 'O'
  char = user_turn ? user : opponent

  loop do
    break if positions_arr.empty? || check_board(board) # Break if terminal node
    pos = positions_arr.pop

    board_clone = clone_board(board)
    update_board!(board_clone, pos, char)

    subtree_node = generate_nodes(board_clone, pos, depth + 1, user, !user_turn)
    tree[:subtree].push(subtree_node)
  end

  case check_board(board)
  when user then tree[:score] = 1
  when 'X' || 'O' then tree[:score] = -1
  when 'TIE' then tree[:score] = 0
  end

  tree
end

def minimax!(node, maximizing)
  return node[:score] if node[:score] # Return node value if terminal node

  if maximizing
    value = -(Float::INFINITY)

    node[:subtree].each do |subnode|
      subnode[:score] = minimax!(subnode, false)
      value = subnode[:score] if subnode[:score] > value
    end
  else # minimizing player
    value = Float::INFINITY

    node[:subtree].each do |subnode|
      subnode[:score] = minimax!(subnode, true)
      value = subnode[:score] if subnode[:score] < value
    end
  end

  value
end

def computer_turn(board)
  position = ai_minimax(board)
  update_board!(board, position, 'O')
end

def get_position(valid_positions)
  position = gets.chomp.to_i
  until valid_positions.include?(position)
    puts "Please enter a valid number position!"
    position = gets.chomp.to_i
  end
  position
end

def print_result(winner)
  case winner
  when 'TIE'
    puts "It's a tie!"
  when 'X'
    puts "You win!"
  when 'O'
    puts "Computer wins!"
  end
end

def play_game(turn)
  board = generate_board

  display(board)

  while !check_board(board)
    if turn == "player"
      player_turn(board)
      turn = "computer"
    else
      computer_turn(board)
      display(board)
      turn = "player"
    end
  end

  display(board) if turn == "computer"
  print_result(check_board(board))

  check_board(board)
end

RULES = [
  "Tic Tac Toe is a 2 player game played on a 3x3 board. Each player takes",
  "a turn and marks a square on the board. The first player to reach 3 squares",
  "in a row, including diagonals, wins. If all 9 squares are marked and no",
  "player has 3 squares in a row, then the game is a tie.",
  "The grand winner is the first to 5 wins."
]

puts "Welcome to Tic-Tac-Toe!"

puts "Would you like to read the rules? (y/n)"
if gets.chomp.downcase == 'y'
  RULES.each { |rule| puts rule.center(80) }

  puts
  puts "Press enter once you are ready to begin playing.".center(80)
  gets
end

loop do
  scores = { player: 0, computer: 0 }

  loop do
    puts "Who should go first? (player, computer, random)"
    first_turn = gets.chomp.downcase

    while !%w(player computer random).include?(first_turn)
      puts "Please enter a valid option!"
      first_turn = gets.chomp.downcase
    end
    first_turn = %w(player computer).sample if first_turn == 'random'

    case play_game(first_turn)
    when 'X' then scores[:player] += 1
    when 'O' then scores[:computer] += 1
    end

    puts "Player's score: #{scores[:player]}, Computer's score: "\
         "#{scores[:computer]}"

    if scores[:player] == 5
      puts "You are the grand winner! Good job!"
      break
    elsif scores[:computer] == 5
      puts "The computer is the grand winner! Better luck next time!"
      break
    end

    puts "Press enter to continue."
    gets
  end

  puts "Would you like to play again? (y/n)"
  break unless gets.chomp.downcase == 'y'
end

puts "Thank you for playing!"
