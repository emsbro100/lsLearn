def bubble_sort!(array)
  sorted = false
  while !sorted
    (array.size - 1).times do |idx|
      if array[idx] > array[idx + 1]
        array[idx], array[idx + 1] = array[idx + 1], array[idx]
        break
      end
      sorted = true if idx == array.size - 2
    end
  end
end

array = [5, 3]
bubble_sort!(array)
p array 

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
p array

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
p array
