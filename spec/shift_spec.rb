require 'rspec'
require './lib/shift.rb'
require './lib/character.rb'

RSpec.describe Shift do
  before :each do
    @shift = Shift.new(@nums)
  end

  it 'exists' do
    expect(@shift).to be_a(Shift)
  end

  it 'initializes with attributes' do
    expect(@shift.nums).to eq([0, 1, 2, 3, 4, 5, 6, 7, 8, 9])
    expect(@shift.key).to be_a(String)
    expect(@shift.key.length).to eq(5)
  end

  it 'can test that it returns an array of 5 numbers' do
    allow(@shift).to receive(:key).and_return('05973')

    expect(@shift.key).to eq('05973')
  end
end
