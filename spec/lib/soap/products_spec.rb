require "savon/mock/spec_helper"

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

  describe '.get_product' do
    it 'returns result when id is sent' do
      id = 795863
      fixture = File.read('spec/fixtures/products/get_by_id.xml')
      savon.expects(:get_by_id).with(message: {productId: id}).returns(fixture)

      client = Citybreak::SOAP::Client.new(api_key: 'test')
      response = client.get_product(id)

      expect(response[:id].to_i).to eq(id)
    end
  end

  describe '.get_products_changes' do
    it 'should return a list of updated changes' do
      fixture = File.read('spec/fixtures/products/get_channel_changes.xml')
      savon.expects(:get_channel_changes).with(message: {since: Date.today}).returns(fixture)

      client = Citybreak::SOAP::Client.new(api_key: 'test')
      response = client.get_products_changes(Date.today)
      expect(response[:updated_product][:int].size).to eq(5) # Fixture has 5 entries
    end

    it 'should raise an error when date is older then 30 days' do
      client = Citybreak::SOAP::Client.new(api_key: 'test')
      expect { client.get_products_changes('1950-10-12') }.to raise_error { |error|
          expect(error).to be_a(Citybreak::Error::DateToOld)
      }
    end
  end

  describe '.product_operations' do
    it 'should return a list of all operations, including supported operations' do
      client = Citybreak::SOAP::Client.new(api_key: 'test')

      expect(client.products_operations).to include(:list_all)
    end
  end

end
