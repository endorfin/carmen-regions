# Carmen Regions

Adds two new methods `region` and `sub_region` to the [Carmen](https://github.com/jim/carmen) gem's Country object. 
This will return the Regions associated with the country. Regions are retrieved from the [ISO-3166-Countries-with-Regional-Codes](https://github.com/lukes/ISO-3166-Countries-with-Regional-Codes)

## Installation

Add this line to your application's Gemfile:

    gem 'carmen-regions'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install carmen-regions

## Usage

Fetch a Carmen::Country object and call the new region method on it:
```ruby
country = Carmen::Country.coded('us')
country.region #=> 'Americas'
country.sub_region #=> 'Northern America'
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/carmen-regions/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
