require 'spec_helper'

describe Algorithms::WordCombinations do

  before do
    @wc = Algorithms::WordCombinations
  end

  describe 'default' do
    before do
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

  describe 'custom' do
    it 'should return correct value v1' do
      dictionary = ['a', 'aa', 'b', 'ab']
      target = 'aaa'
      expect(@wc.find_possible_combinations(dictionary, target)).to eq(['a a a', 'a aa', 'aa a'].sort)
    end

    it 'should return correct value v2' do
      dictionary = ['a', 'aa', 'aaa', 'b', 'ab']
      target = 'aaa'
      expect(@wc.find_possible_combinations(dictionary, target)).to eq(['a a a', 'a aa', 'aa a', 'aaa'].sort)
    end

    it 'should return correct value v3' do
      dictionary = ['a']
      target = 'aaa'
      expect(@wc.find_possible_combinations(dictionary, target)).to eq(['a a a'].sort)
    end

    it 'should return correct value v4' do
      dictionary = ['a']
      target = 'a'
      expect(@wc.find_possible_combinations(dictionary, target)).to eq(['a'].sort)
    end

    it 'should return correct value v5' do
      dictionary = ['a', 'b', 'c']
      target = ''
      expect(@wc.find_possible_combinations(dictionary, target)).to eq([])
    end

    it 'should return correct value v6' do
      dictionary = ['a', 'b', 'ab', 'ba']
      target = 'abba'
      expect(@wc.find_possible_combinations(dictionary, target)).to eq(['a b b a', 'a b ba', 'ab b a', 'ab ba'].sort)
    end
  end
end