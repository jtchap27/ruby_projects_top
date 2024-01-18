def stock_picker(array)
  array_to_sort = []
  i = 0
  while i < array.length do
    array.each do |number|
      if array.index(number) > i
        comparison_array = [[i, array.index(number)], number - array[i]]
        array_to_sort << comparison_array
      end
    end
    i += 1
  end
  array_to_sort.sort_by! { |single_array| single_array[1] }
  p array_to_sort[array_to_sort.length - 1][0]
end

stock_picker([17,3,6,9,15,8,6,1,10])