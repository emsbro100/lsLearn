=begin
Tic Tac Toe is a 2 player game played on a 3x3 board. Each player takes a turn
and marks a square on the board. First player to reach 3 squares in a row,
including diagonals, wins. If all 9 squares are marked and no player has 3
square in a row, then the game is a tie.

High-level pseudocode
=====================

Main
----
1. Initialize 3x3 game board
2. Display board
3. Run game cycle for player
4. Run game cycle for computer
5. Repeat 4 and 5 until a winner is found or the board is full.
6. Prompt the user to play again? If so, repeat
7. Goodbye!

Game Cycle
----------
1. Get input of where to go
2. Update the game board
3. Display the game board
4. Check for wins
5. Display who's turn it is next and what the status of the game is

Methods:
Main method
Generate game board method
Display game board method
Check for wins method
=end
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
  board.each_index do |line|
    puts middle_line unless line == 0
    puts board[line].map { |char| " #{char} " }.join(LINE_VERTICAL)
  end
end

def position_index(position)
  (position - 1).divmod(3)
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

def all_x_or_o(row)
  row.all?('X') || row.all?('O')
end

def check_board(board)
  lines = [[board[0][0], board[1][1], board[2][2]], # Diagonal lines
           [board[0][2], board[1][1], board[2][0]]]
  lines.merge(board, board.transpose)

  lines.each { |line| return line[0] if all_x_or_o(line) } # Check for winners
  board.each { |row| return 'TIE' if row.any?(' ') } # Check for tie
  nil # No winner or tie
end

def player_turn(board)
  puts "Please enter the number of the position you want to put an X in:"
  puts "(#{empty_positions(board).join(', ')})"
  update_board!(board, get_position(empty_positions(board)), 'X')
end

def computer_turn(board)
  position = empty_positions(board).sample
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

def play_game
  board = generate_board
  turn = "player"

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
end

RULES = [
  "Tic Tac Toe is a 2 player game played on a 3x3 board. Each player takes",
  "a turn and marks a square on the board. First player to reach 3 squares in",
  "a row, including diagonals, wins. If all 9 squares are marked and no player",
  "has 3 square in a row, then the game is a tie."
]

puts "Welcome to Tic-Tac-Toe!"

puts "Would you like to read the rules? (y/n)"
if gets.chomp.downcase == 'y'
  RULES.each { |rule| puts rule.center(80) }
end

loop do
  play_game
  puts "Would you like to play again? (y/n)"
  break unless gets.chomp.downcase == 'y'
end

puts "Thank you for playing!"
