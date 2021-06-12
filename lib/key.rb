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
      nums = (0..9).to_a
      5.times do
        @key << nums.sample
      end
      @key = @key.join
    end
  end

  def create_offset(date = Date.today)
    unless date.to_s.length == 6 && date.is_a?(String) && date.to_i.is_a?(Integer)
      date = Date.parse((date).to_s)
      date = date.strftime("%d%m%y")
    end
      @offset = (date.to_i ** 2).to_s[-4..-1]
  end

  def create_final_shift
    final_shift = Hash.new
    final_shift[:a] = @key[0..1].to_i + @offset[0].to_i
    final_shift[:b] = @key[1..2].to_i + @offset[1].to_i
    final_shift[:c] = @key[2..3].to_i + @offset[2].to_i
    final_shift[:d] = @key[3..4].to_i + @offset[3].to_i

    final_shift
  end
end
