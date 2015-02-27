require 'spec_helper'

TreeNode = Struct.new(:value, :left, :right)
describe Algorithms::TreeLevels do

  before do
    @tl = Algorithms::TreeLevels
  end

  describe 'default' do
    before do
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
      expect(@tl.tree_levels(@tree)).to eq([[0], [1, 3], [2, 4, 5], [6]])
    end
  end

  describe 'custom' do
    it 'should return correct value v1' do
      tree = TreeNode.new(0, nil, nil)
      expect(@tl.tree_levels(tree)).to eq([[0]])
    end

    it 'should return correct value v2' do
      tree = TreeNode.new(0, TreeNode.new(0, nil, nil), TreeNode.new(0, nil, nil))
      expect(@tl.tree_levels(tree)).to eq([[0], [0,0]])
    end
  end
end