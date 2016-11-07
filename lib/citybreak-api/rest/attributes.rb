module Citybreak
  module REST
    module Attributes
      def attributes
        get("/attribute/")
      end

      def raw_attribute(id)
        get "/raw/attribute/#{id}"
      end
    end
  end
end
