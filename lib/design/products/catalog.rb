module Design
  module Products
    class Catalog

      class << self
        def catalog
          [Design::Products::FruitTea.new,
           Design::Products::Strawberries.new,
           Design::Products::Coffee.new]
        end

        def by_name(name)
          catalog.find { |p| p.name == name }
        end
      end

    end
  end
end