module Algorithms
  class WordCombinations
    class << self

      def find_possible_combinations(dictionary, target)
        @global_target = target
        @variants = []
        variants_for(dictionary * target.size)
        @variants.uniq.select { |e| e.join == @global_target }.map { |e| e.join(' ') }.sort
      end

      private
      def without_last(array)
        array.take(array.size - 1)
      end

      def variants_for(combinations)
        combinations.each do |element|
          arr = []
          arr << [element] if @global_target.index(element) == 0
          @variants.each do |variant|
            if @global_target.index(variant.join + element) == 0
              variant << element
            elsif @global_target.index(without_last(variant).join + element) == 0
              arr << without_last(variant) + [element]
            end
          end
          @variants += arr
          index = combinations.index(element)
          combinations.delete_at(index) if index >= 0
          variants_for(combinations)
        end
      end

    end
  end
end