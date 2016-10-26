module Citybreak
  module Config

    class << self
      attr_accessor :api_key

      def reset
        @api_key = nil
      end
    end

    reset
  end
end
