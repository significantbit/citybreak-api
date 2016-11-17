require_relative 'citybreak-api/error'
require_relative 'citybreak-api/config'
require_relative 'citybreak-api/soap'
require_relative 'citybreak-api/rest'
require_relative 'citybreak-api/product'
require_relative 'citybreak-api/products_collection'
require_relative 'citybreak-api/category'

require 'savon'

module Citybreak
  def self.config(&block)
    if block_given?
      block.call(Citybreak::Config)
    else
      Citybreak::Config
    end
  end
end
