require 'spec_helper'

describe Design::Rules::BuyFewGetDiscount do
  before do
    @rule = Design::Rules::BuyFewGetDiscount.new(['FR'])
    @rule.final_price = 1
  end

  it 'should return correct default goal' do
    expect(@rule.default_goal).to eq(3)
  end

  it 'should return correct default final price' do
    expect(@rule.default_final_price).to eq(4.5)
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
        2.times { @co.scan('FR') }
      end

      it 'should return array with not modified products' do
        expect(@rule.apply(@co).map(&:final_price)).to eq([3.11, 3.11])
      end
    end

    describe 'enough goal' do
      before do
        3.times { @co.scan('FR') }
      end

      it 'should return array with modified products' do
        expect(@rule.apply(@co).map(&:final_price)).to eq([1, 1, 1])
      end
    end

  end
end