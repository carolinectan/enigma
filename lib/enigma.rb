require 'date'
require_relative '../lib/key.rb'

class Enigma
  attr_reader :alphabet

  def initialize
    @alphabet = ('a'..'z').to_a << ' '
  end

  def message_char_array(message)
    message.split('')
  end

  def positions_in_alphabet(message_char_array)
    message_char_array.map do |char|
      @alphabet.index(char)
    end
  end

  def char_and_pos(message_char_array, pos_in_alphabet)
    message_char_array.zip(pos_in_alphabet)

  end

  def encrypt(message, key = "a", date = Date.today)
    key = Key.new(key, date)
    message_char_array = self.message_char_array(message)
    pos_in_alphabet = self.positions_in_alphabet(message_char_array)
    char_pos_nested_array = char_and_pos(message_char_array, pos_in_alphabet)



# to shift all letters by 3
# c.map_with_index do |index, pos|
#   @alphabet[pos + 3]
# end
# => ["k", "h", "o", "o", "r", nil, "z", "r", "u", "o", "g"]

if pos % 4 == 0 #char is in pos 0, 4, 8, 12, etc
  @alphabet[pos + key.final_shift[:a]]

elsif pos % 4 == 1 #char is in pos 1, 5, 9, 13, etc
  @alphabet[pos + key.final_shift[:b]]

elsif pos % 4 == 2 #char is in pos 2, 6, 10, 14, etc
  @alphabet[pos + key.final_shift[:c]]

elsif pos % 4 == 3 #char is in pos 3, 7, 11, 15, etc
  @alphabet[pos + key.final_shift[:d]]
end

# account for special char
if @alphabet != char
  return char
end

    # shift a
      # look at first char in message
      # find it's index position in alphabet array
      # then shift it by @final_shift[:a]
        #

    @final_shift[:b]
    @final_shift[:c]
    @final_shift[:c]
  end
end

# the first character (“h”) is shifted by the A shift (3). So “h” becomes “k”.
#
# The second character (“e”) is shifted by the B shift (27). Since there are 27 characters in our set, shifting by 27 gets us back to where we started, so “e” becomes “e”.
#
# The third character (“l”) is shifted by the C shift (73). “l” becomes “d”.
#
# The fourth character (“l”) is shifted by the D shift (20). “l” becomes “e”.
#
# When we get to the 5th character (“o”), we cycle back through the shifts, so “o” is shifted by the A shift (3) and becomes “r”. The sixth character (“ “) is shifted by the B shift (27) and becomes “ “.
#
# The final translation for this example would be:
#
# “hello world” => “keder ohulw”
