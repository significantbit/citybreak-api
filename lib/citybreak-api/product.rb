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

    def as_json(options={})
      {
        Id: @id,
        Name: @name,
        ParentId: @parentId,
        InformationData: @information.map {|i| i.to_h},
        Position: @position,
        ExpiresAt: @expires_at,
        Occasions: @occasions,
        Media: @media.map {|m| m.to_h}
      }
    end

    def to_json(*options)
      as_json(*options).to_json(*options)
    end

  end
end
