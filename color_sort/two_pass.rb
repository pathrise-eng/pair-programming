
test = [2,0,2,1,1,0,2]

def sort_colors(nums)

  red = 0  # represented by 0
  white = 0  # represented by 1
  blue = 0  # represented by 2

  for i in nums
    red += 1 if i == 0
    white += 1 if i == 1
    blue += 1 if i == 2
  end
  # (...) is exclusive in ruby
  for i in (0...red)
    nums[i] = 0
  end
  for i in (0...white)
    nums[i+red] = 1
  end
  for i in (0...blue)
    nums[i+red+white] = 2
  end
  nums
end


p sort_colors(test)
