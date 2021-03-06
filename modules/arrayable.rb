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

  def char_index_and_pos(message)
    char_array = self.char_array(message)
    pos_in_set = self.positions_in_set(char_array)
    char_index = self.char_index(char_array)
    char_index_and_pos = char_array.zip(char_index(char_array), (pos_in_set))
  end
end
