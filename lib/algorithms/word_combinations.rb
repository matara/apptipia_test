module Algorithms
  class WordCombinations
    class << self

      def find_possible_combinations(dictionary, target)
        combinations = dictionary
        target.size.times do
          combinations += dictionary.product(combinations)
        end
        combinations = combinations.uniq.map{|e| e.is_a?(Array) ? e.flatten : e}
        combinations = combinations.select {|e| e.is_a?(Array) ? e.join == target : e == target}
        combinations.map {|w| w.join(' ')}.sort
      end

    end
  end
end