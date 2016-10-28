require_relative 'citybreak-api/error'
require_relative 'citybreak-api/config'
require_relative 'citybreak-api/soap'
require_relative 'citybreak-api/rest'

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
