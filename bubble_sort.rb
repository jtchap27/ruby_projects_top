def bubble_sort(array)
  x = 0
  while x < array.length do
    i = 0
    while i < array.length - 1 do
      if array[i] > array[i + 1]
        num_to_swap = array[i]
        array[i] = array[i + 1]
        array[i + 1] = num_to_swap
        i += 1
      else
        i += 1
      end
      sorted_array = array
      array = sorted_array
    end
    x += 1
  end
  array
end


p bubble_sort([4,3,78,2,0,2])