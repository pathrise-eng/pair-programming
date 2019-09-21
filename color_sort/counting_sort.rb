
test = [2,0,2,1,1,0,2]

def sort_counting(nums)
  # Create counting box, the length is 3 because there are 3 'colors'
  count = [0,0,0]
  # Create results array equal to size of input
  res = Array.new(nums.size,nil)
  # Gather counts for each 'color'
  for color in nums
    count[color] += 1
  end
  # count: [2,2,3]
  # Gather the cumulative count for each color
  count.each_index do |i|
    next if i == 0
    count[i] += count[i-1]
  end
  # This represents the positions for each color in the output sequence
  # count: [2,4,7]

  # Place the objects in their new positions
  nums.each_index do |i|
    # Fetch the index for the given item
    new_index = count[nums[i]]-1
    # Place it in results array
    res[new_index] = nums[i]
    # Decrement the count for that item
    count[nums[i]] -= 1
  end
  # Modify the original array as per question description
  res.each_index do |i|
    nums[i] = res[i]
  end
end


p sort_counting(test)
