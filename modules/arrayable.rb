module Arrayable
  def char_array(message)
    message.split('')
  end

  def positions_in_set(char_array)
    char_array.map do |char|
      @set.index(char)
    end
  end

  def char_index(char_array)
    (0..char_array.length - 1).to_a
  end
end
