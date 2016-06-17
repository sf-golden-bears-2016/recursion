def binary_search_include?(object, array)
  # if the array is empty, return false
  return false if array.empty?
  # find the middle
  middle_index = array.length/2
  middle = array[middle_index]
  # compare to input
  return true if middle == object
  # if smaller than middle, do binary search on the front half
  if object < middle
    binary_search_include?(object, array[0...middle_index])
  else
    binary_search_include?(object, array[middle_index + 1..-1])
  end
  # if larger than middle do binary search on take the last half
end

p binary_search_include?(:a, [:a, :e, :f, :z])
p binary_search_include?(:e, [:a, :e, :f, :z])
p binary_search_include?(:d, [:a, :e, :f, :z])


# can you do this in-place rather than slicing the arrays?
