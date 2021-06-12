require 'date'

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
end
