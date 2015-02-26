module Design
  module Rules
    class BuyOneGetOneFree < Design::Rules::Base

      def default_goal
        2
      end

      def apply(card)
        card.products.map do |product|
          if valid_product?(product)
            increment_progress
            apply_rule_for(product) if goal_reached?
          end
          product
        end
      end

      def final_price
        0
      end

      private

      def apply_rule_for(product)
        clear_progress
        product.apply_rule(self)
      end
    end
  end
end