module Cryptable
  def crypt(char_index_and_pos, key, math_symbol)
    message = char_index_and_pos.map do |char, index, pos|
      if !set.include?(char)
        char
      elsif index % 4 == 0
        @set.rotate([key.final_shift[:a], pos].inject(math_symbol))[0]
      elsif index % 4 == 1
        @set.rotate([key.final_shift[:b], pos].inject(math_symbol))[0]
      elsif index % 4 == 2
        @set.rotate([key.final_shift[:c], pos].inject(math_symbol))[0]
      elsif index % 4 == 3
        @set.rotate([key.final_shift[:d], pos].inject(math_symbol))[0]
      end
    end.join
  end
end
