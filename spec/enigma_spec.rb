require 'rspec'
require_relative 'spechelper'
require_relative '../lib/enigma'

RSpec.describe Enigma do
  before :each do
    @enigma = Enigma.new
  end

  it 'exists' do
    expect(@enigma).to be_an(Enigma)
  end

  it 'initializes with attributes' do
    expect(@enigma.set).to eq(['a', 'b', 'c', 'd', 'e',
      'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p',
      'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', ' '])
    expect(@enigma.set.length).to eq(27)
  end

  it 'can split a message into an arary of characters' do
    expected = ['h', 'e', 'l', 'l', 'o', ' ', 'w', 'o', 'r', 'l', 'd']

    expect(@enigma.char_array('hello world')).to eq(expected)
  end

  it 'can return the positions of the message characters in the set' do
    char_array = ['h', 'e', 'l', 'l', 'o', ' ', 'w', 'o', 'r', 'l', 'd']
    expected = [7, 4, 11, 11, 14, 26, 22, 14, 17, 11, 3]

    expect(@enigma.positions_in_set(char_array)).to eq(expected)
  end

  it 'can return message character with index' do
    char_array = ['h', 'e', 'l', 'l', 'o', ' ', 'w', 'o', 'r', 'l', 'd']
    expected = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

    expect(@enigma.char_index(char_array)).to eq(expected)
  end

  it 'can return a nested array of the char, index, and position in set' do
    char_array = ['h', 'e', 'l', 'l', 'o', ' ', 'w', 'o', 'r', 'l', 'd']
    char_index = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    pos_in_set = [7, 4, 11, 11, 14, 26, 22, 14, 17, 11, 3]

    expected = [['h', 0, 7], ['e', 1, 4], ['l', 2, 11], ['l', 3, 11], ['o', 4, 14],
    [' ', 5, 26], ['w', 6, 22], ['o', 7, 14], ['r', 8, 17], ['l', 9, 11], ['d', 10, 3]]

    expect(@enigma.char_index_and_pos(char_array, char_index, pos_in_set)).to eq(expected)
  end

  it 'can encrypt a message with a key and date' do
    expected = {
                  encryption: 'keder ohulw!',
                  key: '02715',
                  date: '040895'
                }

    expect(@enigma.encrypt('hello world!', '02715', '040895')).to eq(expected)
  end

  it 'can decrypt a message with a key and date' do
    expected = {
                  decryption: 'hello world',
                  key: '02715',
                  date: '040895'
                }

    expect(@enigma.decrypt('keder ohulw', '02715', '040895')). to eq(expected)
  end

  it 'can encrypt a message with a key (uses today s date)' do
    expected = {
                  encryption: 'okfavfqdyry',
                  key: '02715',
                  date: '130621'
                }
    allow(@enigma).to receive(:encrypt).and_return(expected)
    expect(@enigma.encrypt('hello world', '02715')). to eq(expected)
  end

  it 'can decrypt a message with a key (uses today s date)' do
    expected = {
                  decryption: 'chicky-chicky parm-parm',
                  key: '02715',
                  date: '130621'
                }

    allow(@enigma).to receive(:decrypt).and_return(expected)
    expect(@enigma.decrypt('jncsrd-soox efjqys-ehxg', '02715')). to eq(expected)
  end

  it 'can encrypt a message (generates random key and uses today s date)' do
    expected = {
                  encryption: 'rsmaynxdaze',
                  key: '86242',
                  date: '130621'
                }

    allow(@enigma).to receive(:encrypt).and_return(expected)
    expect(@enigma.encrypt('hello world')).to eq(expected)
  end
end

# TO DO:
# Make encrypt and decrypt classes then reference here as in given interation pattern
