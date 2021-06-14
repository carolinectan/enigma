require 'date'
require_relative 'key'
require_relative 'encrypt'
require_relative 'decrypt'
require_relative '../modules/arrayable'
require_relative '../modules/hashable'

class Enigma
  include Arrayable
  include Hashable

  attr_reader :set

  def initialize
    @set = ('a'..'z').to_a << ' '
  end

  def encrypt(message, key_arg = 'a', date_arg = Date.today)
    Encrypt.new(message, key_arg, date_arg)
  end

  def decrypt(message, key_arg = 'a', date_arg = Date.today)
    key = Key.new(key_arg, date_arg)
    message = self.char_index_and_pos(message.downcase).map do |char, index, pos|
      if !set.include?(char) then char
      elsif index % 4 == 0 then @set.rotate(pos - key.final_shift[:a])[0]
      elsif index % 4 == 1 then @set.rotate(pos - key.final_shift[:b])[0]
      elsif index % 4 == 2 then @set.rotate(pos - key.final_shift[:c])[0]
      elsif index % 4 == 3 then @set.rotate(pos - key.final_shift[:d])[0]
      end
    end.join
    message_output('decryption', message, key)
  end
end
