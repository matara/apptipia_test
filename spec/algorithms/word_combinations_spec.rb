require 'spec_helper'

describe Algorithms::WordCombinations do

  before do
    @wc = Algorithms::WordCombinations
    @dictionary = ['a', 'b', 'c', 'ab', 'abc']
  end

  it 'should return correct value' do
    target = 'aabc'
    expect(@wc.find_possible_combinations(@dictionary, target)).to eq(['a abc', 'a a b c', 'a ab c'].sort)
  end

  it 'should return empty array' do
    target = 'aabcx'
    expect(@wc.find_possible_combinations(@dictionary, target)).to eq([])
  end

end