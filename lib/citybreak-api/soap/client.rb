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

      def call(client, operation, message={})
        options = {}
        options[:languageId] = 2
        options[:apiKey] = Citybreak.config.api_key
        msg = options.merge(message)
        get_client(client).call(:list_all, message: msg)
      end

      private

      def get_client(type)
        case type.to_sym
        when :products
          @products_client
        when :categories
          @categories_client
        when :templates
          @templates_client
        else
          raise Citybreak::Error::NoSuchClientType
        end
      end
    end
  end
end
