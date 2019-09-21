
# Solution using modified Binary Search

def find_range(array, target):
    start_idx = find_bound(array, target, True)
    end_idx = find_bound(array, target, False)
    return (start_idx,end_idx)

def find_bound(array, target, look_left):
    low = 0
    high = len(array) - 1
    while low <= high:
        mid = (low + high) // 2
        if array[mid] < target:
            low = mid + 1
        elif array[mid] > target:
            high = mid - 1
        else:
            if look_left:
                if mid == 0 or array[mid-1] != target:
                    return mid
                else:
                    high = mid - 1
            else: # look_right
                if mid == len(array)-1 or array[mid+1] != target:
                    return mid
                else:
                    low = mid + 1
    return -1

sorted_array = [-3,0,1,1,1,2,3,3,5]
print(find_range(sorted_array, 1))
print(find_range(sorted_array, 4))

