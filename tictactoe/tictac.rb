class TicTacToe
  X = 'x'
  O = 'o'

  def initialize
    @board = Array.new(3) {Array.new(3,' ')}
    @player_turn = X
    @num_of_moves = 0
  end

  def display_board
    puts ""
    @board.each do |row|
      row.each {|cell| print "| #{cell} "}
      puts "|"
    end
  end

  def make_move(row,col)
    if row > 2 || row < 0 || col > 2 || col < 0 || @board[row][col] != ' '
      throw "Illegal move"
    end
    @board[row][col] = @player_turn
    @num_of_moves += 1
    check_winner(row,col)
    swap_turn
  end

  private

  def swap_turn
    @player_turn == X ? @player_turn = O : @player_turn = X
  end

  def check_winner(row,col)
    board_size = 3
    # Check column
    board_size.times do |r|
      break if @board[r][col] != @player_turn
      announce_win if r == board_size-1
    end
    # Check row
    board_size.times do |c|
      break if @board[row][c] != @player_turn
      announce_win if c == board_size-1
    end
    # Check Down Diagonal
    if row == col
      board_size.times do |i|
        break if @board[i][i] != @player_turn
        announce_win if i == board_size-1
      end
    end
    # Check Up Diagonal
    if row+col == board_size-1
      board_size.times do |i|
        break if @board[i][board_size-1 - i] != @player_turn
        announce_win if i == board_size-1
      end
    end

    if @num_of_moves == board_size*board_size
      announce_draw
    end

  end

  def announce_win
    display_board
    puts "The winner is '#{@player_turn}'!"
    exit
  end

  def announce_draw
    display_board
    puts "There is a draw!"
    exit
  end

end


# Test Win Condition
@game = TicTacToe.new

@game.make_move(1,1)
@game.make_move(2,0)
@game.make_move(0,0)
@game.make_move(2,1)
@game.make_move(2,2)

# Test Draw Condition
@game2 = TicTacToe.new

@game2.make_move(1,1)
@game2.make_move(2,0)
@game2.make_move(0,0)
@game2.make_move(2,2)
@game2.make_move(2,1)
@game2.make_move(0,1)
@game2.make_move(1,2)
@game2.make_move(1,0)
@game2.make_move(0,2)
