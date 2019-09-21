
test = [2,0,2,1,2,0,1]

# [0,1,0,1,2,2,2] -> 2 as mid
# [0,0,1,1,2,2,2] -> 1 as mid
# [0,0,2,2,1,2,1] -> 0 as mid

# i: 0
# j: 0
# k: 6

ij           k
[2,0,2,1,2,0,1]

def in_place(nums)
  i = j = 0
  k = nums.size-1
  while (j <= k) do
    # if num < mid
    if (nums[j] == 0)
      swap(nums,i,j)
      i += 1
      j += 1
    # if num > mid
    elsif (nums[j] == 2)
      swap(nums,k,j)
      k -= 1
    # if num == mid
    else
      j += 1
    end
  end
  nums
end


def swap(array,first,second)
  temp = array[second]
  array[second] = array[first]
  array[first] = temp
end


p in_place test
