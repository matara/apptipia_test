require 'spec_helper'

describe Design::Products::Catalog do
  it 'should return list of products' do
    expect(Design::Products::Catalog.catalog.map(&:class)).to eq([Design::Products::FruitTea,
                                                                  Design::Products::Strawberries,
                                                                  Design::Products::Coffee])
  end
end