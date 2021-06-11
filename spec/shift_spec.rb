require 'rspec'
require './lib/shift.rb'
require './lib/character.rb'

RSpec.describe Shift do
  before :each do
    @shift = Shift.new(character_set)
  end

  it 'exists' do
    expect(@shift).to be_an(Shift)
  end

  it 'initializes with attributes' do
    expect(@shift.character_set).to eq((['a', 'b', 'c', 'd', 'e',
      'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p',
      'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', ' ']))
  end

  xit 'can return a random 5-digit number' do

  end

  xit 'can '
  # a.sample(4)      #=> [6, 4, 2, 5]
end
