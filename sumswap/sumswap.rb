arr_1 = [4,1,2,1,1,2]
arr_2 = [3,6,3,3]

def sum_swap(first,second)

  big_array = first.length > second.length ? first : second
  small_array = first.length <= second.length ? first : second

  small_sum = small_array.sum
  big_sum = 0
  big_hash = {}
  big_array.each_with_index do |num,i|
    big_sum += num
    big_hash[num] = i
  end

  small_array.each_with_index do |a,i|
    b = (0.5*big_sum - 0.5*small_sum + a)
    next if (b % 1 != 0)
    b = b.to_i
    if big_hash[b]
      return [a,b]
    end
  end
  []
end

p sum_swap(arr_1,arr_2)
