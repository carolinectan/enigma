class Shift
  attr_reader :nums, :key

  def initialize(nums)
    @nums = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

    @key = Array.new
    until @key.length == 5
      @key << @nums.sample(1)
    end
    @key = @key.join
  end

end
