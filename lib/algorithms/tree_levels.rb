module Algorithms
  class TreeLevels
    class << self

      def tree_levels(tree)
        levels(tree)
      end

      def levels(node, level = 0, result_array = [])
        return result_array if node.nil?
        result_array[level] = [] unless result_array[level]
        result_array[level] << node.value
        level += 1
        levels(node.left, level, result_array)
        levels(node.right, level, result_array)
      end

    end
  end
end