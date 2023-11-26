=begin
Write a method that takes two sorted Arrays as arguments, and returns a new
Array that contains all elements from both arguments in sorted order.
You may not provide any solution that requires you to sort the result array. You
must build the result array one element at a time in the proper order.

input: array of ints, array of ints
output: array of ints

rules:
- do not mutate the input arrays
- do not use any sorting
- does not need to handle improper inputs
- must handle empty array inputs

data structure:
- array, array as inputs
- array as output

algorithm:
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
=end

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

p merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
p merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
p merge([], [1, 4, 5]) == [1, 4, 5]
p merge([1, 4, 5], []) == [1, 4, 5]
