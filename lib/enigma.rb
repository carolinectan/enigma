require 'date'
require_relative '../lib/key.rb'

class Enigma
  attr_reader :alphabet

  def initialize
    @alphabet = ('a'..'z').to_a << ' '
  end

  def encrypt(message, key = Key.new, date = Date.today)
    key.create_offsets(date)
    key.final_shift
  end
end
