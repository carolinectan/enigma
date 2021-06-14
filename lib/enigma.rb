require 'date'
require_relative '../lib/key'
require_relative '../modules/arrayable'
require_relative '../modules/hashable'
require_relative '../modules/cryptable'

class Enigma
  include Arrayable
  include Cryptable
  include Hashable

  attr_reader :set

  def initialize
    @set = ('a'..'z').to_a << ' '
  end

  def encrypt(message, key_arg = 'a', date_arg = Date.today)
    key = Key.new(key_arg, date_arg)
    char_index_and_pos = self.char_index_and_pos(message)
    # self.crypt(char_index_and_pos, key, ('+').to_sym)
    message = char_index_and_pos.map do |char, index, pos|
      if !set.include?(char)
        char
      elsif index % 4 == 0
        @set.rotate(pos + key.final_shift[:a])[0]
      elsif index % 4 == 1
        @set.rotate(pos + key.final_shift[:b])[0]
      elsif index % 4 == 2
        @set.rotate(pos + key.final_shift[:c])[0]
      elsif index % 4 == 3
        @set.rotate(pos + key.final_shift[:d])[0]
      end
    end.join
    message_output("encryption", message, key)
  end

  def decrypt(message, key_arg, date_arg = Date.today)
    key = Key.new(key_arg, date_arg)
    char_index_and_pos = self.char_index_and_pos(message)
    message = char_index_and_pos.map do |char, index, pos|
      if !set.include?(char)
        char
      elsif index % 4 == 0
        @set.rotate(pos - key.final_shift[:a])[0]
      elsif index % 4 == 1
        @set.rotate(pos - key.final_shift[:b])[0]
      elsif index % 4 == 2
        @set.rotate(pos - key.final_shift[:c])[0]
      elsif index % 4 == 3
        @set.rotate(pos - key.final_shift[:d])[0]
      end
    end.join
    message_output("decryption", message, key)
  end
end
