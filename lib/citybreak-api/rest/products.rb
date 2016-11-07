module Citybreak
  module REST
    module Products
      def get_product(id, options={})
        Citybreak::Product.new get("/raw/product/#{id}")[0]
      end

      def get_raw_product(id, options = {})
        Citybreak::Product.new get("/raw/product/#{id}")[0]
      end

      def get_paged(count = 50)
        Citybreak::ProductsCollection.new(get("/raw/product/getpaged/#{count}"))
      end

      def next(token)
        Citybreak::ProductsCollection.new(get("/raw/product/getnext/#{token}"))
      end
    end
  end
end
