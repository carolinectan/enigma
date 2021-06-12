require_relative 'spechelper'
require 'rspec'
require './lib/shift'
require './lib/character'

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
    expect(@shift.key.to_i).to be_an(Integer)
    expect(@shift.offsets).to eq('')
  end

  it 'can test that it returns an array of 5 numbers' do
    allow(@shift).to receive(:key).and_return('05973')

    expect(@shift.key).to eq('05973')
  end

  it 'can create offsets' do
    expect(@shift.create_offsets).to be_a(String)
    expect(@shift.create_offsets.length).to eq(4)

    allow(@shift).to receive(:create_offsets).and_return('5641')
    expect(@shift.create_offsets).to eq('5641')
  end

  it 'can create offsets with a date input as a numeric DDMMYY string' do
    expect(@shift.create_offsets('160221')).to eq('8841')
  end

  it 'can generate keys a b c and d keys as a hash' do
    # key = double('39927')
    stubbed_expected = {
                          :a_key => '39',
                          :b_key => '99',
                          :c_key => '92',
                          :d_key => '27'
                        }
    allow(@shift).to receive(:key_split).and_return(stubbed_expected)

    expect(@shift.key_split).to eq(stubbed_expected)
  end

  it 'can generate a b c and d offsets as a hash' do
    # key = double('39927')
    # stubbed_expected = {
    #                      :a_offset => '39',
    #                      :b_offset => '99',
    #                      :c_offset => '92',
    #                      :d_offset => '27'
    #                     }
    # allow(@shift).to receive(:key_split).and_return(stubbed_expected)

    # expect(@shift.key_split).to eq(stubbed_expected)
    expect(@shift.final_shift).to eq()
  end

end
  # it 'can test that it returns an offset of 4 numbers' do
  #   allow(@shift).to receive(:key).and_return('05973')
  #
  #   expect(@shift.key).to eq('05973')
  # end
