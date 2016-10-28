module Citybreak
  module Config
    class << self
      attr_accessor :api_key,
                    :wsdl_products,
                    :wsdl_categories,
                    :wsdl_templates,
                    :rest_endpoint

      attr_reader :api_endpoint

      def api_endpoint=(key)
        @api_endpoint = key
        set_wsdl
      end

      def reset
        @api_key = nil
        @api_endpoint = 'http://api.cbis.citybreak.com'
        @rest_endpoint = "https://cbis-rest-api.citybreak.com/v1/api"
        set_wsdl
      end

      private

      def set_wsdl
        @wsdl_products = "#{@api_endpoint}/Products.asmx?WSDL"
        @wsdl_categories = "#{@api_endpoint}/Categories.asmx?WSDL"
        @wsdl_templates = "#{@api_endpoint}/Templates.asmx?WSDL"
      end
    end

    reset
  end
end
