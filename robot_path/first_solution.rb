class Coord
  attr_reader :row, :col

  def initialize(row,col)
    @row = row
    @col = col
  end

  def to_s
    "(#{row},#{col})"
  end

  alias :inspect :to_s

  def ==(other)
    return self.class == other.class && row == other.row && col == other.col
  end

  alias :eql? :==

end



# Solution 1


def find_path(mat)
  result = []
  search_for_home(mat,0,0,result)
  return result
end

def is_out_of_bounds(mat,row,col)
  return (row < 0 || col < 0 || row >= mat.size || col >= mat[0].size)
end

# mat, 0,0, res= []
def search_for_home(mat,row,col,res)
  return false if (is_out_of_bounds(mat,row,col) || mat[row][col] == 1)

  found_home = (row == mat.length-1 && col == mat[0].length - 1)

  if (found_home || search_for_home(mat,row+1,col,res) || search_for_home(mat,row,col+1,res))
    # prepend coordinate to result array
    res.unshift Coord.new(row,col)
    return true
  end

  return false
end


# Example 1
       # 0 1 2 3 4
grid = [[0,0,0,1,0], # 0
        [0,0,0,0,0], # 1
        [1,0,0,1,0], # 2
        [1,1,0,1,0]] # 3



p find_path(grid)
puts "\n\n"


# Example 2
        # 0 1 2 3 4 5 6
grid2 = [[0,0,0,0,0,0,0], # 0
         [0,0,0,0,0,1,0], # 1
         [0,0,0,0,0,1,0], # 2
         [0,0,0,0,0,1,0], # 3
         [0,0,0,0,0,1,0], # 4
         [0,0,0,0,0,1,0]] # 5
                       

p find_path(grid2)

