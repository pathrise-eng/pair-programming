

# 14

  [1,3,4,6,9,12,15]
#  0 1 2 3 4 5  6
def bin_search(target,array)
  lo = 0
  hi = array.length - 1
  mid = (lo+hi)/2
  while lo <= hi
    if array[mid] > target
      hi = mid-1
      mid = (lo+hi)/2
    elsif array[mid] < target
      lo = mid+1
      mid = (lo+hi)/2
    else
      return mid
    end
  end
  return -1
end

test = [1,3,4,6,9,12,15]

p bin_search(14,test)
p bin_search(15,test)
p bin_search(3,test)
