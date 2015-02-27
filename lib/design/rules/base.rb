module Design
  module Rules
    class Base
      attr_accessor :progress, :product_names, :goal, :final_price

      def initialize(product_names = [])
        @progress = 0
        @product_names = product_names
        @goal = default_goal
        @final_price = default_final_price
      end

      private
      def goal_reached?
        progress >= goal
      end

      def valid_product?(product)
        self.product_names.include?(product.name)
      end

      def increment_progress
        self.progress += 1
      end

      def clear_progress
        self.progress = 0
      end

      def default_goal
        0
      end

      def default_final_price
        0
      end
    end
  end
end