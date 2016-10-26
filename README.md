# Citybreak-api

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
- Online 3 Widgets
- Online3 Booking tracking
- Online 3 Body-tag special CSS classes
- Citybreak booking Statfeed API
- CBIS Export API

## Usage

### CBIS SOAP API
#### Setup a SOAP client
```ruby
client = Citybreak::SOAP::Client.new(api_key: 'API_KEY')
```

Or you can also set the skip api_key option if you configurated it before
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

## Development
