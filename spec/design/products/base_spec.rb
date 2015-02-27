require 'spec_helper'

describe Design::Products::Base do
  before do
    @product = Design::Products::Base.new
    @rule = Design::Rules::Base.new
    @rule.final_price = 9
    @product.apply_rule(@rule)
  end

  it 'should return correct price for product' do
    expect(@product.final_price).to eq(9)
  end

  it 'should add rule to applied_rules' do
    expect(@product.applied_rules).to include(@rule)
  end
end