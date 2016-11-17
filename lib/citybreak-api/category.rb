module Citybreak
  class Category
    attr_accessor :id,
                  :name,
                  :translations,
                  :path

    def initialize(values = {})
      @id = values['Id']
      @name = values['Name']
      @translations = values['Translations']
      @path = values['Path']
    end
  end
end
