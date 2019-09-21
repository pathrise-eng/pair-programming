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

  # This allows using the Coords as hash keys
  def hash
    @row.hash ^ @col.hash # XOR
  end

  def ==(other)
    return self.class == other.class && row == other.row && col == other.col
  end

  alias :eql? :==

end


# DP Solution


def find_path(mat)
  result = []
  search_for_home(mat,0,0,result)
  return result
end

def is_out_of_bounds(mat,row,col)
  return (row < 0 || col < 0 || row >= mat.size || col >= mat[0].size)
end

# mat,0,0,res=[],bad_paths={}
def search_for_home(mat,row,col,res,bad_paths = {})
  return false if (is_out_of_bounds(mat,row,col) || mat[row][col] == 1)

  point = Coord.new(row,col)
  return false if (bad_paths[point])

  found_home = (row == mat.length-1 && col == mat[0].length - 1)

  if (found_home || search_for_home(mat,row+1,col,res,bad_paths) || search_for_home(mat,row,col+1,res,bad_paths))
    # prepend coordinate to result array
    res.unshift point
    return true
  end

  bad_paths[point] = true
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



