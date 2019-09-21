
# Given two integer arrays A and B, return the maximum length of a subarray that appears in both arrays.

def find_length(a, b)
  ans = 0
  memo = Array.new(a.size) {Array.new(b.size, 0)}
  a.each_with_index do |a_el,i|
    b.each_with_index do |b_el,j|
      if (a_el == b_el)
        if i == 0 || j == 0 
          memo[i][j] = 1
        else
          memo[i][j] = memo[i-1][j-1] + 1
        end
        ans = memo[i][j] if ans < memo[i][j]
      end
    end
  end
  return ans
end

 i      
[1,2,3,5]
 j        
[5,1,1,2,3]
























#
#  [[0,1,1,0,0],
#   [0,0,0,2,0],
#   [0,0,0,0,3],
#   [1,0,0,0,0]]
