module Design
  module Products
    class Base
      attr_accessor :final_price, :applied_rules

      def initialize
        @final_price = price
        @applied_rules = []
      end

      def apply_rule(rule)
        @applied_rules << rule
        @final_price = rule.final_price
      end

      def price
        0
      end
    end
  end
end