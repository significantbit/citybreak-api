require "savon/mock/spec_helper"
require 'pp'
describe Citybreak::SOAP::Products do
  include Savon::SpecHelper

  # set Savon in and out of mock mode
  before(:all) { savon.mock!   }
  after(:all)  { savon.unmock! }

  describe '.get_products' do
    it 'should return all products' do
      key = 'api-key'
      fixture = File.read('spec/fixtures/products/list_all.xml')
      savon.expects(:list_all).with(message: {}).returns(fixture)

      client = Citybreak::SOAP::Client.new(api_key: key)
      response = client.get_products

      expect(response).to have_key(:items)
      expect(response).to have_key(:total_pages)
      expect(response).to have_key(:total_results)
      expect(response).to have_key(:page_index)
      expect(response).to have_key(:page_size)
      expect(response[:items][:product].size).to eq(2)
    end
  end

  describe '.product_operations' do
    it 'should return a list of all operations, including supported operations' do
      client = Citybreak::SOAP::Client.new(api_key: 'test')

      expect(client.products_operations).to include(:list_all)
    end
  end

end
