test = [8,5,2,6,1,9,8]



def quick_sort(array,i=0,j=array.length-1)
  return if i >= j

  pivot = i
  low = pivot+1
  high = j

  while low <= high
    if array[low] > array[pivot] && array[high] < array[pivot]
      swap(low,high,array)
    end
    low += 1 if array[low] <= array[pivot]
    high -= 1 if array[high] >= array[pivot]
  end
  swap(pivot,high,array)
  pivot = high
  # For recursive call stack reason, you always call
  # on the smaller sub array first?
  len1 = j - pivot
  len2 = pivot - i
  if len1 < len2
    quick_sort(array,pivot+1,j)
    quick_sort(array,i,pivot-1)
  else
    quick_sort(array,i,pivot-1)
    quick_sort(array,pivot+1,j)
  end
  return array
end


def swap(i,j,array)
  temp = array[j]
  array[j] = array[i]
  array[i] = temp
end

p quick_sort(test)
