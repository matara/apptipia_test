require 'spec_helper'

describe Design::Rules::BuyOneGetOneFree do
  before do
    @rule = Design::Rules::BuyOneGetOneFree.new(['FR'])
  end

  it 'should return correct default goal' do
    expect(@rule.default_goal).to eq(2)
  end

  it 'should return correct default final price' do
    expect(@rule.default_final_price).to eq(0)
  end

  describe 'apply' do
    before do
      @co = Design::Checkout.new([@rule])
    end

    it 'should return empty array' do
      expect(@rule.apply(@co)).to eq([])
    end

    describe 'not enough goal' do
      before do
        @co.scan('FR')
        @co.scan('SR')
      end

      it 'should return array with not modified products' do
        expect(@rule.apply(@co).map(&:final_price)).to eq([3.11, 5])
      end
    end

    describe 'enough goal' do
      before do
        3.times { @co.scan('FR') }
      end

      it 'should return array with modified products' do
        expect(@rule.apply(@co).map(&:final_price)).to eq([3.11, 0, 3.11])
      end
    end

  end
end