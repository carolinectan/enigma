require_relative 'spechelper'
require 'rspec'
require './lib/enigma.rb'

RSpec.describe Enigma do
  before :each do
    @enigma = Enigma.new
  end

  it 'exists' do
    expect(@enigma).to be_an(Enigma)
  end

  it 'initializes with attributes' do
    expect(@enigma.alphabet).to eq(["a", "b", "c", "d", "e",
      "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p",
      "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "])
    expect(@enigma.alphabet.length).to eq(27)

  end

##########
  it 'can split a message into an arary of characters' do
    expected = ["h", "e", "l", "l", "o", " ", "w", "o", "r", "l", "d"]

    expect(@enigma.message_char_array('hello world')).to eq(expected)
  end

  it 'can return the positions of the message characters in the alphabet' do
    message_char_array = ["h", "e", "l", "l", "o", " ", "w", "o", "r", "l", "d"]
    expected = [7, 4, 11, 11, 14, 26, 22, 14, 17, 11, 3]

    expect(@enigma.positions_in_alphabet(message_char_array)).to eq(expected)
  end

  it 'can return a nested array of the char and its position in the alphabet' do
    message_char_array = ["h", "e", "l", "l", "o", " ", "w", "o", "r", "l", "d"]
    pos_in_alphabet = [7, 4, 11, 11, 14, 26, 22, 14, 17, 11, 3]
    expected = [["h", 7], ["e", 4], ["l", 11], ["l", 11], ["o", 14],
    [" ", 26], ["w", 22], ["o", 14], ["r", 17], ["l", 11], ["d", 3]]

    expect(@enigma.char_and_pos(message_char_array, pos_in_alphabet)).to eq(expected)
  end
##########
  xit 'can encrypt a message with a key and date' do
    expected = {
                  encryption: "keder ohulw",
                  key: "02715",
                  date: "040895"
                }

    expect(@enigma.encrypt("hello world", "02715", "040895")).to eq(expected)
  end

  xit 'can decrypt a message with a key and date' do
    expected = {
                  decryption: "hello world",
                  key: "02715",
                  date: "040895"
                }

    expect(@enigma.decrypt("keder ohulw", "02715", "040895")). to eq(expected)
  end

  xit 'can encrypt a message with a key (uses today s date)' do
    expect(@encrypted = enigma.encrypt("hello world", "02715")). to eq() # encryption hash here
  end

  xit 'can decrypt a message with a key (uses today s date)' do
    expect(@encrypted = enigma.decrypt(encrypted[:encryption], "02715")). to eq() # decryption hash here
  end

  xit 'can encrypt a message (generates random key and uses today s date)' do
    expect(@enigma.encrypt("hello world")).to eq() # encryption hash here
  end
end

#Enigma#encrypt(message, key, date)
# The encrypt method takes a message String as an argument. It can optionally take a Key and Date as arguments to use for encryption. If the key is not included, generate a random key. If the date is not included, use today’s date.
#
# The encrypt method returns a hash with three keys:
#
# :encryption => the encrypted String
# :key => the key used for encryption as a String
# :date => the date used for encryption as a String in the form DDMMYY
#
#
# Enigma#decrypt(ciphertext, key, date)
# The decrypt method takes a ciphertext String and the Key used for encryption as arguments. The decrypt method can optionally take a date as the third argument. If no date is given, this method should use today’s date for decryption.
#
# The decrypt method returns a hash with three keys:
#
# :decryption => the decrypted String
# :key => the key used for decryption as a String
# :date => the date used for decryption as a String in the form DDMMYY

# Interaction Pattern
# The Enigma class should respond to the following interaction pattern:
