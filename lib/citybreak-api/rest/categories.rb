module Citybreak
  module REST
    module Categories
      def get_raw_category(id, options = {})
        Citybreak::Category.new get("/raw/category/#{id}")
      end
    end
  end
end
