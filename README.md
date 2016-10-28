# Citybreak-api
[![Build Status](https://travis-ci.org/significantbit/citybreak-api.svg?branch=master)](https://travis-ci.org/significantbit/citybreak-api)
[![Coverage Status](https://coveralls.io/repos/github/significantbit/citybreak-api/badge.svg)](https://coveralls.io/github/significantbit/citybreak-api)
## Installation

** !!! NOTE: NOT YET AVAILABLE !!! **

```bash
  gem install citybreak-api
```

or in Gemfile

```ruby
  gem 'citybreak-api'
```

## API:s Available
- CBIS REST API
- CBIS SOAP API (DEPRECATED)


## Not Available (yet?)
- Online 3 Linking API
- Online 3 Event REST API
- Citybreak booking Statfeed API

## Usage

### CBIS SOAP API (!!DEPRECATED!!)
#### Setup a SOAP client
```ruby
client = Citybreak::SOAP::Client.new(api_key: 'API_KEY')
```

Or you can also skip to set the api_key option if you configurated it before
```ruby
Citybreak.config do |config|
  api_key = 'API_KEY'
end
client = Citybreak::SOAP::Client.new
```

#### Documentation

[Products Documentation](https://github.com/significantbit/citybreak-api/wiki/SOAP-::-Product-Documentaion)

[Categories Documentation](https://github.com/significantbit/citybreak-api/wiki/SOAP::Categories-Documentaion)


##### Call specific operation
If you want to call and handle the result from the Savon client itself you can call operations with this method

```ruby
## Retrieve all products
# @param client_type ('products', 'categories' or 'templates')
# @param operation
# @param message (optional)
#

client.call(:products, :list_all, {languageId: 1})
```

## Development
