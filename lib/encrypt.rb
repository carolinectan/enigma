require_relative 'key'
require_relative '../modules/arrayable'
require_relative '../modules/hashable'

class Encrypt
  include Arrayable
  include Hashable

  attr_reader :message, :key_arg, :date_arg, :set

  def initialize(message, key_arg = 'a', date_arg = Date.today)
    @message = message
    @key_arg = key_arg
    @date_arg = date_arg
    @set = ('a'..'z').to_a << ' '
    @encrypt = self.encrypt(message, key_arg = 'a', date_arg = Date.today)
  end

  def encrypt(message, key_arg = 'a', date_arg = Date.today)
    key = Key.new(key_arg, date_arg)
    result = self.char_index_and_pos(message.downcase).map do |char, index, pos|
      if !set.include?(char) then char
      elsif index % 4 == 0 then @set.rotate(pos + key.final_shift[:a])[0]
      elsif index % 4 == 1 then @set.rotate(pos + key.final_shift[:b])[0]
      elsif index % 4 == 2 then @set.rotate(pos + key.final_shift[:c])[0]
      elsif index % 4 == 3 then @set.rotate(pos + key.final_shift[:d])[0]
      end
    end.join
    message_output('encryption', result, key)
  end
end
