module Design
  module Rules
    class BuyFewGetDiscount < Design::Rules::Base

      def default_goal
        3
      end

      def apply(card)
        card.products.map do |product|
          if valid_product?(product)
            increment_progress
            apply_rule_for(card) if goal_reached?
          end
          product
        end
      end

      def final_price
        4.5
      end

      private

      def apply_rule_for(card)
        clear_progress
        card.products.each do |product|
          product.apply_rule(self) if valid_product?(product)
        end
      end
    end
  end
end