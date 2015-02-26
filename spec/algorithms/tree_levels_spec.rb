require 'spec_helper'

describe Algorithms::TreeLevels do

  before do
    @tl = Algorithms::TreeLevels

    TreeNode = Struct.new(:value, :left, :right)
    @tree = TreeNode.new(0,
                         TreeNode.new(1,
                                      nil,
                                      TreeNode.new(2, nil, nil)

                         ),
                         TreeNode.new(3,
                                      TreeNode.new(4, nil, nil),
                                      TreeNode.new(5,
                                                   TreeNode.new(6, nil, nil),
                                                   nil)
                         )

    )
  end

  it 'should return correct value' do
    value = [[0], [1, 3], [2, 4, 5], [6]]
    expect(@tl.tree_levels(@tree)).to eq(value)
  end

end