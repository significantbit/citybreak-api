require_relative 'citybreak-api/config'

module Citybreak
  def self.config(&block)
    if block_given?
      block.call(Citybreak::Config)
    else
      Citybreak::Config
    end
  end
end
