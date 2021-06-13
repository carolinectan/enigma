require 'date'
require_relative '../lib/key.rb'

class Enigma
  attr_reader :alphabet

  def initialize
    @alphabet = ('a'..'z').to_a << ' '
  end

  def char_array(message)
    message.split('')
  end

  def positions_in_alphabet(char_array)
    char_array.map do |char|
      @alphabet.index(char)
    end
  end

  def char_index(char_array)
    (0..char_array.length - 1).to_a
  end

  def char_index_and_pos(char_array, char_with_index, pos_in_alph)
    char_index(char_array).zip(pos_in_alph)
  end

  def encrypt(message, key_arg = "a", date_arg = Date.today)
    key = Key.new(key_arg, date_arg)
    char_array = self.char_array(message)
    pos_in_alph = self.positions_in_alphabet(char_array)
    char_index = self.char_index(char_array)
    char_index_and_pos = char_index_and_pos(char_array, char_index, pos_in_alph)

    encrypted_message = char_index_and_pos.map do |index, pos|
      if index % 4 == 0 #char in pos 0, 4, 8, etc
        @alphabet.rotate(pos + key.final_shift[:a])[0]
      elsif index % 4 == 1 #char in pos 1, 5, 9, etc
        @alphabet.rotate(pos + key.final_shift[:b])[0]
      elsif index % 4 == 2 #char in pos 2, 6, 10, etc
        @alphabet.rotate(pos + key.final_shift[:c])[0]
      elsif index % 4 == 3 #char in pos 3, 7, 11, etc
        @alphabet.rotate(pos + key.final_shift[:d])[0]
      end
    end.join

    {
      encryption: encrypted_message,
      key: key_arg,
      date: date_arg
    }

  # TO DO: Account for special chars
  # if !alph.include?(char)
  #   return char
  # end
  end
end
