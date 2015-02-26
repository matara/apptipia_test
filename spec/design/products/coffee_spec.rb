require 'spec_helper'

describe Design::Products::Coffee do
  before do
    @product = Design::Products::Coffee.new
  end

  it 'should return correct name' do
    expect(@product.name).to eq('CF')
  end


  it 'should return correct price' do
    expect(@product.price).to eq(11.23)
  end
end