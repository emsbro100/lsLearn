=begin
Sort an array of passed values using merge sort. You can assume that this array
may contain only one type of data. And that data may be either all numbers or
all strings.

input: array of strings or integers
output: array of strings or integers

rules:
- input will be either all string or all integers

data structure:
- array as input
- array as output
- nested arrays for storing data while sorting

algorithm:
split_arr
=========
- given input array 'arr'
- create a new empty array 'split_arr'
- find the middle point of arr by dividing its size by 2.0 and rounding up,
  assign that to the variable "middle"
- slice arr from index 0 to middle (excl), add that to split_arr
- slice arr from index middle to end (incl), add that to split_arr
- return split_arr

split_arr_recursive
===================
- given input array 'arr'
- if size of arr is greater than 1:
  - call split_arr on arr, assign returned value to new_arr
  - call split_arr_recursive on each element of new_arr, assign that element to
    its returned value from the recursive method
- return new_arr

merge
=====
- given input arrays 'nums1' and 'nums2'
- create two new ints with the value 0, 'idx1' and 'idx2'
- create a new empty array 'nums_merged'
- while nums_merged size is less than nums1 size + nums2 size
  - if idx1 >= size of nums1:
    - add the number at nums2[idx2] to nums_merged
    - increase idx2
  - else if idx2 >= size of nums2:
    - add the number at nums1[idx1] to nums_merged
    - increase idx1
  - else if nums1[idx1] < nums2[idx2]:
    - add the number at nums1[idx1] to nums_merged
    - increase idx1
  - else:
    - add the number at nums2[idx2] to nums_merged
    - increase idx2
- return nums_merged

merge_recursive
===============
- given input arrays 'arr1' and 'arr2'
- if arr1 has subarrays:
  - set it to the return value of calling merge_recursive on its first and second arr
- if arr2 has subarrays:
  - set it to the return value of calling merge_recursive on its first and second arr
- return the return value of calling merge on arr1 and arr2

merge_sort
==========
- given input array 'arr'
- call split_arr_recursive on arr, assign the return value to arr_divided
- return the return value of calling merge_recursive with the first and second
  arrays of arr_divided provided as arguments
=end

def split_arr(arr)
  split_arr = []
  middle = (arr.size / 2.0).round

  split_arr.push(arr.slice(...middle))
  split_arr.push(arr.slice(middle..))

  split_arr
end

def split_arr_recursive(arr)
  if arr.size > 1
    new_arr = split_arr(arr)
    new_arr.map! { |el| split_arr_recursive(el) }
  else
    new_arr = arr
  end

  new_arr
end

def merge(nums1, nums2)
  idx1 = 0
  idx2 = 0
  nums_merged = []

  while nums_merged.size < nums1.size + nums2.size
    if idx1 == nums1.size
      nums_merged.push(nums2[idx2])
      idx2 += 1
    elsif idx2 == nums2.size
      nums_merged.push(nums1[idx1])
      idx1 += 1
    elsif nums1[idx1] < nums2[idx2]
      nums_merged.push(nums1[idx1])
      idx1 += 1
    else
      nums_merged.push(nums2[idx2])
      idx2 += 1
    end
  end

  nums_merged
end

def merge_recursive(arr1, arr2) 
  arr1 = merge_recursive(arr1[0], arr1[1]) if arr1.any? { |el| el.is_a?(Array) }
  arr2 = merge_recursive(arr2[0], arr2[1]) if arr2.any? { |el| el.is_a?(Array) }

  merge(arr1, arr2)
end

def merge_sort(arr)
  arr1, arr2 = split_arr_recursive(arr)
  merge_recursive(arr1, arr2)
end

p merge_sort([9, 5, 7, 1]) == [1, 5, 7, 9]
p merge_sort([5, 3]) == [3, 5]
p merge_sort([6, 2, 7, 1, 4]) == [1, 2, 4, 6, 7]
p merge_sort(%w(Sue Pete Alice Tyler Rachel Kim Bonnie)) == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
p merge_sort([7, 3, 9, 15, 23, 1, 6, 51, 22, 37, 54, 43, 5, 25, 35, 18, 46]) == [1, 3, 5, 6, 7, 9, 15, 18, 22, 23, 25, 35, 37, 43, 46, 51, 54]
