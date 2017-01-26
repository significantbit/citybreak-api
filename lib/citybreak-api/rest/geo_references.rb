module Citybreak
  module REST
    module GeoReferences
      def raw_geo(id)
        get "/raw/geo/#{id}"
      end
    end
  end
end

