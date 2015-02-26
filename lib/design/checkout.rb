Dir[File.dirname(__FILE__) + '/products/*.rb'].each { |file| require file }
Dir[File.dirname(__FILE__) + '/rules/*.rb'].each { |file| require file }

module Design
  class Checkout
    attr_reader :products, :rules

    def initialize(rules = [])
      @products = []
      @rules = rules
    end

    def scan(product_name)
      product = Design::Products::Catalog.by_name(product_name)
      raise('PRODUCT NOT IMPLEMENTED YET :)') unless product
      @products << product
    end

    def total_price
      apply_discount
      @products.map(&:final_price).inject { |sum, x| sum + x }
    end

    private
    def apply_discount
      @rules.each { |rule| rule.apply(self) }
    end

  end
end