require 'spec_helper'

describe Design::Checkout do

  describe 'default' do
    before do
      rule1 = Design::Rules::BuyOneGetOneFree.new('FR')
      rule2 = Design::Rules::BuyFewGetDiscount.new('SR')
      @co = Design::Checkout.new([rule1, rule2])
    end

    it 'should return correct price for test1' do
      @co.scan('FR')
      @co.scan('SR')
      @co.scan('FR')
      @co.scan('FR')
      @co.scan('CF')
      expect(@co.total_price).to eq(22.45)
    end

    it 'should return correct price for test2' do
      @co.scan('FR')
      @co.scan('FR')
      expect(@co.total_price).to eq(3.11)
    end

    it 'should return correct price for test3' do
      @co.scan('SR')
      @co.scan('SR')
      @co.scan('FR')
      @co.scan('SR')
      expect(@co.total_price).to eq(16.61)
    end
  end

  describe 'fails' do
    before do
      @co = Design::Checkout.new
    end

    it 'should raise an error' do
      expect { @co.scan('AAA') }.to raise_error
    end
  end

  describe 'custom' do
    before do
      @rule1 = Design::Rules::BuyOneGetOneFree.new(['FR', 'SR'])
      @rule2 = Design::Rules::BuyFewGetDiscount.new('FR')
      @rule2.final_price = 2
      @rule3 = Design::Rules::BuyFewGetDiscount.new('SR')
    end

    describe 'rules order 1,2,3' do
      before do
        @co = Design::Checkout.new([@rule1, @rule2, @rule3])
      end

      it 'should return correct price v1' do
        3.times { @co.scan('FR') }
        expect(@co.total_price).to eq(6)
      end

      it 'should return correct price v2' do
        2.times { @co.scan('FR')}
        expect(@co.total_price).to eq(3.11)
      end

      it 'should return correct price v2' do
        3.times { @co.scan('FR') }
        2.times { @co.scan('SR') }
        @co.scan('CF')
        expect(@co.total_price).to eq(22.23)
      end
    end

    describe 'rules order 3, 1, 2' do
      before do
        @co = Design::Checkout.new([@rule2, @rule3, @rule1])
      end

      it 'should return correct price v1' do
        3.times { @co.scan('FR') }
        expect(@co.total_price).to eq(4)
      end

      it 'should return correct price v2' do
        2.times { @co.scan('FR') }
        expect(@co.total_price).to eq(3.11)
      end

      it 'should return correct price v2' do
        3.times { @co.scan('FR') }
        2.times { @co.scan('SR') }
        @co.scan('CF')
        expect(@co.total_price).to eq(20.23)
      end
    end
  end
end