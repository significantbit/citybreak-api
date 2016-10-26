module Citybreak
  module SOAP
    module Products

      DEFAULT_OPTIONS = {
        languageId: 1,
        categoryId: 0,
        templateId: 0,
        pageOffset: 0,
        itemsPerPage: 0,
        filter: {
          highlights: false,
          withOccasionsOnly: false,
          includeArchivedProducts: false,
          includeInactiveProducts: false,
          bookableProductsFirst: false,
          excludeProductsWhereNameNotInCurrentLanguage: false,
          excludeProductsNotInCurrentLanguage: false,
          excludeProductsWithoutOccasions: false,
          orderBy: 'None',
          sortOrder: 'None',
          randomSortSeed: 0,
          subCategoryId: 0,
        }
      }

      def products_operations
        @products_client.operations
      end

      def get_products(options={})
        options[:apiKey] = Citybreak.config.api_key
        msg = DEFAULT_OPTIONS.merge(options)
        @products_client.call(:list_all, message: msg).hash[:envelope][:body][:list_all_response][:list_all_result]
      end
    end
  end
end
