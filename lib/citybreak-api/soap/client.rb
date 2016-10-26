require_relative 'products'

module Citybreak
  module SOAP
    class Client
      include Citybreak::SOAP::Products

      def initialize(options = {})
        # Set configuration with options if they are set
        Citybreak::Config.instance_variables.each do |key|
          Citybreak::Config.instance_variable_set(key, options[key[1..-1].to_sym] || Citybreak::Config.instance_variable_get(key))
        end
        raise Citybreak::Error::NoAPIKeySpecified if Citybreak.config.api_key.nil?

        @products_client = Savon.client(wsdl: Citybreak.config.wsdl_products)
        @categories_client = Savon.client(wsdl: Citybreak.config.wsdl_categories)
        @templates_client = Savon.client(wsdl: Citybreak.config.wsdl_templates)
      end
    end
  end
end
