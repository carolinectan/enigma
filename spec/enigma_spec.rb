require 'rspec'
require './lib/enigma.rb'

RSpec.describe Enigma do
  before :each do
    @enigma = Enigma.new
  end

  it 'exists' do
    expect(@enigma).to be_an(Enigma)
  end

  it 'can encrypt a message with a key and date' do
    expected = {
                  encryption: "keder ohulw",
                  key: "02715",
                  date: "040895"
                }

    expect(@enigma.encrypt("hello world", "02715", "040895")).to eq(expected)
  end

  it 'can decrypt a message with a key and date' do
    expected = {
                  decryption: "hello world",
                  key: "02715",
                  date: "040895"
                }


    expect(@enigma.decrypt("keder ohulw", "02715", "040895"). to eq(expected)
  end

  it 'can encrypt a message with a key (uses today s date)' do
    expect(@encrypted = enigma.encrypt("hello world", "02715"). to eq() # encryption hash here
  end

  it 'can decrypt a message with a key (uses today s date)' do
    expect(@encrypted = enigma.decrypt(encrypted[:encryption], "02715"). to eq() # decryption hash here
  end

  it 'can encrypt a message (generates random key and uses today s date)' do
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
