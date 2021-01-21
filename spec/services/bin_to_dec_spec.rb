require 'rails_helper'

RSpec.describe BinToDec do
  context 'when the input is valid sting' do
    it 'returns the corresponding integer number' do
      expect(BinToDec.call('1010')).to eq(10)
    end

    it 'returns the corresponding integer number' do
      expect(BinToDec.call('10101111')).to eq(175)
    end
  end

  context 'when the input is invalid' do
    it 'raises an error' do
      expect{BinToDec.call('1010FF')}.to raise_error
    end
  end
end
