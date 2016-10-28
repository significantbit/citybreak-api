module Citybreak
  module REST
    module Products
      def get_product(id, options={})
        get "/raw/product/#{id}"
      end
    end
  end
end
