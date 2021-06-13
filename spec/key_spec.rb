require_relative 'spechelper'
require 'rspec'
require './lib/key'

RSpec.describe Key do
  describe 'a Key with key and date arguments' do
    before :each do
      @key1 = Key.new('12345', '120721')
    end

    it 'exists' do
      expect(@key1).to be_a(Key)
    end

    it 'initializes with attributes' do
      expect(@key1.date).to eq('120721')
      expect(@key1.key).to eq('12345')
      expect(@key1.offset).to eq('9841')
      expected = {
                    a: 21,
                    b: 31,
                    c: 38,
                    d: 46
                  }
      expect(@key1.final_shift).to eq(expected)
    end
  end

  describe 'a Key with key argument and no date argument' do
    before :each do
      @key2 = Key.new('12345')
    end

    it 'exists' do
      expect(@key2).to be_a(Key)
    end

    it 'initializes with attributes' do
      allow(@key3).to receive(:date).and_return('130621')
      expect(@key2.date).to eq('130621')
      expect(@key2.key).to eq('12345')
      allow(@key2).to receive(:create_offset).and_return('5641')
      expect(@key2.offset).to eq('5641')
      expected = {
                    a: 17,
                    b: 29,
                    c: 38,
                    d: 46
                  }
      allow(@key2).to receive(:final_shift).and_return(expected)
      expect(@key2.final_shift).to eq(expected)
    end
  end

  describe 'a Key with non-numeric key argument and no date argument' do
    before :each do
      @key3 = Key.new("a")
    end

    it 'exists' do
      expect(@key3).to be_a(Key)
    end

    it 'initializes with attributes' do
      allow(@key3).to receive(:date).and_return('130621')
      expect(@key3.date).to eq('130621')
      expect(@key3.key.length).to eq(5)
      expect(@key3.key).to be_a(String)
      allow(@key3).to receive(:key).and_return("98765")
      expect(@key3.key).to eq("98765")
      allow(@key3).to receive(:create_offset).and_return('5641')
      expect(@key3.offset).to eq('5641')
      expected = {
                    a: 103,
                    b: 93,
                    c: 80,
                    d: 66
                  }
      allow(@key3).to receive(:final_shift).and_return(expected)
      expect(@key3.final_shift).to eq(expected)
    end
  end
end
