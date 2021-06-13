require 'date'
require_relative '../lib/key.rb'

class Enigma
  attr_reader :set

  def initialize
    @set = ('a'..'z').to_a << ' '
  end

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

  def index_and_pos(char_array, char_index, pos_in_set)
    char_index(char_array).zip(pos_in_set)
  end

#####
  def char_index_and_pos_arr(char_array, char_index, pos_in_set)
    char_array.zip(char_index(char_array).zip(pos_in_set)).map do |char, num_arr|
      [char, num_arr].flatten
    end
  end # => [["h", 0, 7], ["e", 1, 4], ["l", 2, 11], ["l", 3, 11], ["o", 4, 14], [" ", 5, 26], ["w", 6, 22], ["o", 7, 14], ["r", 8, 17], ["l", 9, 11], ["d", 10, 3]]

  def encrypt(message, key_arg = "a", date_arg = Date.today)
    key = Key.new(key_arg, date_arg)
    char_array = self.char_array(message)
    pos_in_set = self.positions_in_set(char_array)
    char_index = self.char_index(char_array)

    char_index_and_pos = char_index_and_pos(char_array, char_index, pos_in_set)
# require "pry"; binding.pry
    encrypted_message = char_index_and_pos.map do |index, pos|
      if index % 4 == 0
        @set.rotate(pos + key.final_shift[:a])[0]
      elsif index % 4 == 1
        @set.rotate(pos + key.final_shift[:b])[0]
      elsif index % 4 == 2
        @set.rotate(pos + key.final_shift[:c])[0]
      elsif index % 4 == 3
        @set.rotate(pos + key.final_shift[:d])[0]
      end
    end.join

    {
      encryption: encrypted_message,
      key: key.key,
      date: key.date
    }
  end
#####
#   def encrypt(message, key_arg = "a", date_arg = Date.today)
#     key = Key.new(key_arg, date_arg)
#     char_array = self.char_array(message)
#     pos_in_set = self.positions_in_set(char_array)
#     char_index = self.char_index(char_array)
#     char_index_and_pos = char_index_and_pos(char_array, char_index, pos_in_set)
# require "pry"; binding.pry
#     encrypted_message = char_index_and_pos.map do |index, pos|
#       if index % 4 == 0
#         @set.rotate(pos + key.final_shift[:a])[0]
#       elsif index % 4 == 1
#         @set.rotate(pos + key.final_shift[:b])[0]
#       elsif index % 4 == 2
#         @set.rotate(pos + key.final_shift[:c])[0]
#       elsif index % 4 == 3
#         @set.rotate(pos + key.final_shift[:d])[0]
#       end
#     end.join
#
#     {
#       encryption: encrypted_message,
#       key: key.key,
#       date: key.date
#     }
#
#   # TO DO: Account for special chars
#   # if !set.include?(char)
#   #   return char
#   # end
#   end
end
