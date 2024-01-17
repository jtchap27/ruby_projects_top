def substrings(string, array)
  original_string_array = string.downcase.split(" ").map { |str| str.split("") }
  string_hash = {}
  i = 0
  while i < original_string_array.length do
    single_array = original_string_array[i]
    array.map do |word|
      if word.split("").difference(single_array) == []
        if string_hash[word] == nil
          string_hash[word] = 1
        else
          string_hash[word] += 1
        end
      end
    end
    i += 1
  end
  puts string_hash
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

substrings("BeLOw", dictionary)