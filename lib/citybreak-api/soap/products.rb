module Citybreak
  module SOAP
    module Products
      DEFAULT_LANGUAGE = 2

      DEFAULT_GET_OPTIONS = {
        languageId: DEFAULT_LANGUAGE,
        templateId: 0
      }

      DEFAULT_LIST_OPTIONS = {
        languageId: DEFAULT_LANGUAGE,
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

      def get_products_changes(date)
        parsedDate = DateTime.parse(date.to_s)
        raise Citybreak::Error::DateToOld, 'Date can\'t be older then 30 days' if parsedDate <= (Date.today - 30)
        msg = {}
        msg[:apiKey] = Citybreak.config.api_key
        msg[:since] = parsedDate
        @products_client.call(:get_channel_changes, message: msg).hash[:envelope][:body][:get_channel_changes_response][:get_channel_changes_result]
      end

      def get_product(id, options={})
        options[:apiKey] = Citybreak.config.api_key
        options[:productId] = id
        msg = DEFAULT_GET_OPTIONS.merge(options)
        @products_client.call(:get_by_id, message: msg).hash[:envelope][:body][:get_by_id_response][:get_by_id_result]
      end

      def get_products(options={})
        options[:apiKey] = Citybreak.config.api_key
        msg = DEFAULT_LIST_OPTIONS.merge(options)
        @products_client.call(:list_all, message: msg).hash[:envelope][:body][:list_all_response][:list_all_result]
      end
    end
  end
end
