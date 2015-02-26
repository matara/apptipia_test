require 'spec_helper'

describe Design::Products::FruitTea do
  before do
    @product = Design::Products::FruitTea.new
  end

  it 'should return correct name' do
    expect(@product.name).to eq('FR')
  end


  it 'should return correct price' do
    expect(@product.price).to eq(3.11)
  end
end