module Citybreak
  class ProductsCollection
    include Enumerable

    attr_accessor :products, :total_results, :continue_token

    def initialize(data)
      return unless data.is_a?(Sawyer::Resource)
      @continue_token = data[:ContinueToken]
      @total_results = data[:TotalResults]
      @products = data[:Result].map {|p| Citybreak::Product.new p }
    end

    def <<(val)
      @products << val
    end

    def each(&block)
      @products.each(&block)
    end

    def has_next?
      !@continue_token.nil?
    end
  end
end
