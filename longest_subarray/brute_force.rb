def find_length(a, b)
  ans = 0
  # in Ruby `...` means range excluding second value
  for i in (0...a.size)
    for j in (0...b.size)
      k = 0
      while (a[i+k] == b[j+k] && i+k < a.size && j+k < b.size) do
        k += 1
      end
      ans = k if ans < k
    end
  end
  return ans
end


[2,0,1,3,5]
[3,5,2,0,1]

