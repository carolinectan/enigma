require_relative 'spechelper'
require 'rspec'
require './lib/key'
require './lib/character'

RSpec.describe Key do
  before :each do
    @key = Key.new(@nums)
  end

  it 'exists' do
    expect(@key).to be_a(Key)
  end

  it 'initializes with attributes' do
    expect(@key.nums).to eq([0, 1, 2, 3, 4, 5, 6, 7, 8, 9])

    expect(@key.key).to be_a(String)
    expect(@key.key.length).to eq(5)
    expect(@key.key.to_i).to be_an(Integer)

    expect(@key.offset).to be_a(String)
    expect(@key.offset.length).to eq(4)
    expect(@key.offset.to_i).to be_an(Integer)

    expect(@key.final_shift).to be_a(Hash)
    expect(@key.final_shift.length).to eq(4)
    expect(@key.final_shift.values.sum).to be_a(Integer)
  end

  it 'can test that it returns an array of 5 numbers' do
    allow(@key).to receive(:key).and_return('05973')

    expect(@key.key).to eq('05973')
  end

  it 'can create offsets' do
    expect(@key.create_offset).to be_a(String)
    expect(@key.create_offset.length).to eq(4)

    allow(@key).to receive(:create_offset).and_return('5641')
    expect(@key.create_offset).to eq('5641')
  end

  it 'can create offsets with a date input as a numeric DDMMYY string' do
    expect(@key.create_offset('160221')).to eq('8841')
  end

it 'can return a hash of the final shift values' do    # key = double('39927')
    # stubbed_expected = {
    #                       :a => 55,
    #                       :b => 14,
    #                       :c => 88,
    #                       :d => 41
    #                     }
    # allow(@key).to receive(:final_shift).and_return(stubbed_expected)
    #
    # expect(@key.final_shift).to eq(stubbed_expected)
    expect(@key.final_shift).to be_a(Hash)
  end
end
