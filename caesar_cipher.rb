def caesar_cipher(str, num)
  if num > 26
    num -= 26
  elsif num < -26
    num += 26
  end
  ord_arr = str.split("").map { |char| char.ord }
  shifted_arr = ord_arr.map do |e| 
    range1 = 65..90
    range2 = 97..122
    if range1.include?(e)
      y = e + num
      if y < 65
        y += 26
      elsif y > 90
        y -= 26
      end
      e = y
    elsif range2.include?(e)
      y = e + num
      if y < 97
        y += 26
      elsif y > 122
        y -= 26
      end
      e = y
    else
      e = e
    end
  end
  final_str = shifted_arr.map { |elem| elem.chr }.join("")
  puts final_str
end

caesar_cipher("What a string!", 5)