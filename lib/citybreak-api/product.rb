module Citybreak
  class Product
    attr_accessor :id,
                  :name,
                  :parentId,
                  :information,
                  :position,
                  :geos,
                  :expires_at,
                  :occasions,
                  :categories,
                  :media

    def initialize(values = {})
      @id = values[:Id.to_s]
      @name = values[:Name.to_s]
      @geos = values[:GeoReferences.to_s]
      @categories = values[:Categories.to_s]
      @parentId = values[:ParentId.to_s]
      @information = values[:InformationData.to_s]
      @position = values[:Position.to_s]
      @expires_at = Date.new(values[:ExpiresAt.to_s]) unless @expires_at.nil?
      @occasions = values[:Occasions.to_s]
      @media = values[:Media.to_s]
    end

    def as_json(options={})
      {
        Id: @id,
        Name: @name,
        Categories: @categories,
        ParentId: @parentId,
        GeoReferences: @geos,
        InformationData: @information.map {|i| i.to_h},
        Position: @position.to_h,
        ExpiresAt: @expires_at,
        Occasions: @occasions.map {|o| o.to_h},
        Media: @media.map {|m| m.to_h}
      }
    end

    def to_json(*options)
      as_json(*options).to_json(*options)
    end

  end
end
