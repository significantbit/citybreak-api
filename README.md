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
- CBIS SOAP API

## Not Available (yet?)
- Online 3 Linking API
- Online 3 Event REST API
- Citybreak booking Statfeed API
- CBIS Export API

## Usage

### CBIS SOAP API
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

#### Methods

##### Products

###### products_operations
If you want to expose all available operations call:
```ruby
client.products_operations #=> [:get_products...]
```

###### get_products
```ruby
## Retrieve all products
# @param options (optional)
# returns {
#  :total_results => ..,
#  :total_pages => ..,
#  :page_index => ..,
#  :page_size => ..,
#  :items => {:products => [...]}
# }

client.get_products
# or
client.get_products(languageId: 1, itemsPerPage: 40)
```

###### get_product
```ruby
## Retrieve a product
# @param id
# @param options (optional)
# returns {
#  :id => ...,
#  ...
# }

client.get_product(123)
# or
client.get_product(123, languageId: 1)
```

###### get_products_changes
```ruby
## Retrieve changes to products since specific date
# (Date can't be older then 30 days)
# @param date
# @param options (optional)
# returns {
#  :updated_product => [...],
#  :added_product => [...],
#  :deleted_product => [...],
# }

client.get_products_changes('2016-01-01')
# or
client.get_products_changes(Date.today)
```

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
