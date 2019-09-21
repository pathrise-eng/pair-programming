require 'pp'

@board = Array.new(3) {Array.new(3, " ")}


def display_board
  @board.each do |r|
    print "|"
    r.each do |c|
      print " #{c} |"
    end
    puts ""
  end
end

display_board

input = nil

until input == ""

  input = gets.chomp
  coords = input.split(/\s*,+\s*/).map(&:to_i)
  if coords.length != 2 || coords[0] < 0 || coords[0] > 2 || coords[1] < 0 || coords[1] > 2
    puts "Invalid input"
    next
  end

  @board[coords[0]][coords[1]] = 'x'


  display_board

end

def computer_choice

  if @board[1][1] == " "
    set_sqaure(1,1,'o')
    return
  end

  dfs(1,1,'o')

end

def dfs(x,y,letter)
  return if x < 0 || y < 0 || x > 2 || y > 2




end



def set_square(row,col,letter)
  @board[row][col] = letter
end
