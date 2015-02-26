require 'spec_helper'

describe Design::Products::Strawberries do
  before do
    @product = Design::Products::Strawberries.new
  end

  it 'should return correct name' do
    expect(@product.name).to eq('SR')
  end


  it 'should return correct price' do
    expect(@product.price).to eq(5)
  end
end