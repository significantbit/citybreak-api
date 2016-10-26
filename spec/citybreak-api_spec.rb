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
  end
end
