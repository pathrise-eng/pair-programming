


# O(m*n)
def brute_smallest_diff(arr1,arr2)
  res = []
  smallest_diff = Float::INFINITY
  arr1.each do |a|
    arr2.each do |b|
      diff = (b-a).abs
      if diff < smallest_diff
        smallest_diff = diff
        res = [a,b]
      end
    end
  end
  res
end









def more_optimal(arr1,arr2)
  res = []
  smallest_diff = Float::INFINITY
  arr1.sort! # m log(m)
  arr2.sort! # n log(n)
  i = j = 0
  while (i < arr1.length && j < arr2.length)
    a = arr1[i]
    b = arr2[j]
    return [a,b] if a == b
    diff = (b - a).abs
    if diff < smallest_diff
      smallest_diff = diff
      res = [a,b]
    end
    a < b ? i += 1 : j += 1
  end
  res
end

arr1 = [1,3,15,11,2]
arr2 = [23,127,235,19,8]


p brute_smallest_diff(arr1,arr2)
p more_optimal(arr1,arr2)

