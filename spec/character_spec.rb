require 'rspec'
require './lib/character.rb'

RSpec.describe Character do
  before :each do
    values = ('a'..'z').to_a << ' '
    @character = Character.new(values)
  end

  it 'exists' do
    expect(@character).to be_an(Character)
  end

  it 'initializes with a set of characters from a to z plus a space' do
    expect(@character.character_set).to eq(['a', 'b', 'c', 'd', 'e',
      'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p',
      'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', ' '])
    expect(@character.character_set.length).to eq(27)
  end
end
