require_relative 'attributes'
require_relative 'products'
require_relative 'categories'
require 'sawyer'

module Citybreak
  module REST
    class Client
      include Citybreak::REST::Attributes
      include Citybreak::REST::Products
      include Citybreak::REST::Categories

      def initialize(options = {})
        # Set configuration with options if they are set
        Citybreak::Config.instance_variables.each do |key|
          Citybreak::Config.instance_variable_set(key, options[key[1..-1].to_sym] || Citybreak::Config.instance_variable_get(key))
        end
        raise Citybreak::Error::NoAPIKeySpecified if Citybreak.config.api_key.nil?
      end

      # Make a HTTP GET request
      #
      # @param url [String] The path, relative to {#api_endpoint}
      # @param options [Hash] Query and header params for request
      # @return [Sawyer::Resource]
      def get(url, options={})
        request :get, url, options
      end

      def request(method, path, data, options = {})
        response = agent.call(method, URI::Parser.new.escape("#{endpoint}#{path.to_s}"), data, options)
        response.data
      end

      # Hypermedia agent for the Citybreak API
      #
      # @return [Sawyer::Agent]
      def agent
        @agent ||= Sawyer::Agent.new(endpoint) do |http|
          http.headers[:content_type] = "application/json"
          http.headers[:Accept] = "application/json"
          http.headers[:apikey] = Citybreak::Config.api_key
        end
      end

      private

      def endpoint
        Citybreak::Config.rest_endpoint
      end
    end
  end
end
