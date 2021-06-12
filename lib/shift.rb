class Shift
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
require "pry"; binding.pry
    final_shift = {
      :a => @key[0..1].to_i + @offsets[0].to_i,
      :b => @key[1..2].to_i + @offsets[1].to_i,
      :c => @key[2..3].to_i + @offsets[2].to_i,
      :d => @key[3..4].to_i + @offsets[3].to_i
    }
  end

  # def key_split
  #   require "pry"; binding.pry
  #
  #   key_hash = Hash.new
  #
  #   key_hash[:a_key] = @key[0..1]
  #   key_hash[:b_key] = @key[1..2]
  #   key_hash[:c_key] = @key[2..3]
  #   key_hash[:d_key] = @key[3..4]
  # end
  #
  # def offset_hash
  #   offset_hash = Hash.new
  #
  #   offset_hash[:a_offset] = @offsets[0]
  #   offset_hash[:b_offset] = @offsets[1]
  #   offset_hash[:c_offset] = @offsets[2]
  #   offset_hash[:d_offset] = @offsets[3]
  #
  #   # a_offset = @offset[0]
  #   # b_offset = @offset[1]
  #   # c_offset = @offset[2]
  #   # d_offset = @offset[3]
  #   require "pry"; binding.pry
  # end
end
