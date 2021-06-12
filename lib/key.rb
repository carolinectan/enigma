class Key
  attr_reader :nums, :key, :offsets

  def initialize(nums)
    @nums = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

    @key = Array.new
    until @key.length == 5
      @key << @nums.sample
    end
    @key = @key.join

    @offsets = ''
  end

  def create_offsets(date = Date.today)
    unless date.to_s.length == 6 && date.is_a?(String) && date.to_i.is_a?(Integer)
      date = Date.parse((date).to_s)
      date = date.strftime("%d%m%y")
    end
      @offsets = (date.to_i ** 2).to_s[-4..-1]
  end

  def final_shift
    self.create_offsets(date = Date.today) # remove later

    final_shift = Hash.new

    final_shift[:a] = @key[0..1].to_i + @offsets[0].to_i
    final_shift[:b] = @key[1..2].to_i + @offsets[1].to_i
    final_shift[:c] = @key[2..3].to_i + @offsets[2].to_i
    final_shift[:d] = @key[3..4].to_i + @offsets[3].to_i

    final_shift
  end
end
