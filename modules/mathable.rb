module Mathable
  def offset_math
    (@date.to_i**2).to_s[-4..-1]
  end

  def shift_math(range, pos)
    @key[range].to_i + @offset[pos].to_i
  end
end
