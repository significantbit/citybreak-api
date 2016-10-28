describe Citybreak::REST::Client do
    describe '.new' do
        it 'raises an error if no api_key has been configured' do
            expect { Citybreak::REST::Client.new }.to raise_error { |error|
                expect(error).to be_a(Citybreak::Error::NoAPIKeySpecified)
            }
        end

        it 'do not raise an error if api_key has been configured' do
            Citybreak.config do |c|
                c.api_key = 'specified'
            end
            expect { Citybreak::REST::Client.new }.not_to raise_error
        end

        it 'can specify config options with options variables' do
            Citybreak::REST::Client.new(api_key: 'specified-test')
            expect(Citybreak.config.api_key).to eq('specified-test')
            expect { Citybreak::REST::Client.new }.not_to raise_error
        end
    end
end
