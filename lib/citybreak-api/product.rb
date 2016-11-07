module Citybreak
  class Product
    attr_accessor :id,
                  :name,
                  :parentId,
                  :information,
                  :position,
                  :expires_at,
                  :occasions,
                  :media

    def initialize(values = {})
      @id = values[:Id]
      @name = values[:Name]
      @parentId = values[:ParentId]
      @information = values[:InformationData]
      @position = values[:Position]
      @expires_at = Date.new(values[:ExpiresAt]) unless @expires_at.nil?
      @occasions = values[:Occasions]
      @media = values[:Media]
    end
  end
end
