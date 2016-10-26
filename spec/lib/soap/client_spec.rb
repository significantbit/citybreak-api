require "savon/mock/spec_helper"
require 'pp'
describe Citybreak::SOAP::Client do
    include Savon::SpecHelper

    describe '.new' do
        it 'raises an error if no api_key has been configured' do
            expect { Citybreak::SOAP::Client.new }.to raise_error { |error|
                expect(error).to be_a(Citybreak::Error::NoAPIKeySpecified)
            }
        end

        it 'do not raise an error if api_key has been configured' do
            Citybreak.config do |c|
                c.api_key = 'specified'
            end
            expect { Citybreak::SOAP::Client.new }.not_to raise_error
        end

        it 'can specify config options with options variables' do
            Citybreak::SOAP::Client.new(api_key: 'specified-test')
            expect(Citybreak.config.api_key).to eq('specified-test')
            expect { Citybreak::SOAP::Client.new }.not_to raise_error
        end
    end

    describe '.call' do
        it 'can call a specific method' do
            savon.mock!
            fixture = File.read('spec/fixtures/categories/list_all.xml')
            savon.expects(:list_all).with(message: {}).returns(fixture)

            client = Citybreak::SOAP::Client.new(api_key: 'test')
            response = client.call(:categories, :list_all)
            expect(response).to be_successful
            savon.unmock!
        end
    end

    describe '.get_client' do
        it 'returns a product client' do
            expect(Citybreak::SOAP::Client.new(api_key: 'test').send(:get_client, 'products')).to be_an_instance_of(Savon::Client)
        end

        it 'returns a product client' do
            expect(Citybreak::SOAP::Client.new(api_key: 'test').send(:get_client, 'categories')).to be_an_instance_of(Savon::Client)
        end

        it 'returns a templates client' do
            expect(Citybreak::SOAP::Client.new(api_key: 'test').send(:get_client, :templates)).to be_an_instance_of(Savon::Client)
        end

        it 'raises an error when wrong type is sent' do
            expect { Citybreak::SOAP::Client.new(api_key: 'test').send(:get_client, 'wrong_type') }.to raise_error { |error|
            expect(error).to be_a(Citybreak::Error::NoSuchClientType)
          }
        end
    end
end
