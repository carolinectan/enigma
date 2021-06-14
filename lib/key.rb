class Key
  attr_reader :date, :key, :offset, :final_shift

  def initialize(key, date = Date.today)
    @date = date
    @key = self.create_key(key)
    @offset = self.create_offset(@date)
    @final_shift = self.create_final_shift
  end

  def create_key(key)
    if key.length == 5 && key.is_a?(String) && key.to_i.is_a?(Integer)
      key
    else
      @key = Array.new
      5.times do
        @key << ((0..9).to_a).sample
      end
      @key = @key.join
    end
  end

  def offset_math
    (@date.to_i**2).to_s[-4..-1]
  end

  def create_offset(date = Date.today)
    until @date.to_s.length == 6 && @date.is_a?(String) && @date.to_i.is_a?(Integer)
      @date = Date.parse((@date).to_s)
      @date = @date.strftime('%d%m%y')
    end
      offset_math
  end

  def shift_math(range, pos)
    @key[range].to_i + @offset[pos].to_i
  end

  def create_final_shift
    final_shift = Hash.new
    final_shift[:a] = shift_math(0..1, 0)
    final_shift[:b] = shift_math(1..2, 1)
    final_shift[:c] = shift_math(2..3, 2)
    final_shift[:d] = shift_math(3..4, 3)
    final_shift
  end
end
