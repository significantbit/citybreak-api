require 'spec_helper'

require 'citybreak-api'

describe Citybreak do

  describe '.config' do
    it 'can set specific instance variables' do
      Citybreak.config.api_key = 'test-key'
      expect(Citybreak.config.api_key).to eq('test-key')
    end

    it 'can set instance variables with block' do
      Citybreak.config do |c|
        c.api_key = 'api-key'
      end

      expect(Citybreak.config.api_key).to eq('api-key')
    end

    it 'should update wsdl endpoint when endpoint updates' do
      Citybreak.config.api_endpoint = 'http://test.com'
      expect(Citybreak.config.wsdl_products).to eq('http://test.com/Products.asmx?WSDL')
    end
  end
end
