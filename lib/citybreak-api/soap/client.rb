module Citybreak
  module SOAP
    class Client
      def initialize(options = {})
        # Set configuration with options if they are set
        Citybreak::Config.instance_variables.each do |key|
          Citybreak::Config.instance_variable_set(key, options[key[1..-1].to_sym] || Citybreak::Config.instance_variable_get(key))
        end
        raise Citybreak::Error::NoAPIKeySpecified if Citybreak.config.api_key.nil?
      end
    end
  end
end
