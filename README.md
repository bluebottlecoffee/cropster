# Cropster
Cropster ruby gem. Make API calls to cropster to pull green and roasted coffee data.

## Installation

Add this line to your application's Gemfile:

    gem 'cropster'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cropster

Setup Initializer

    CropsterClient = Cropster::Client.new({
                  :api_key => ENV['CROPSTER_API_KEY'],
                  :api_secret => ENV['CROPSTER_API_SECRET'],
                  :group_code => ENV['CROPSTER_GROUP_CODE']})

Optional keys for the client initialization include:

    :test_mode (true | false)

## Usage

### Contacts
#### List Contacts
    Cropster::Contact.new(CropsterClient).contacts({})
#### Get a Contact
    Cropster::Contact.new(CropsterClient).contact("ID")

### Locations
#### List Locations
    Cropster::Location.new(CropsterClient).locations({})
#### Get a Location
    Cropster::Location.new(CropsterClient).location("ID")

### Lots
#### Get a Lot
    Cropster::Lot.new(CropsterClient).lot("ID")
#### List Lots
    Cropster::Lot.new(CropsterClient).lots

### Processing
#### List Processings
    Cropster::Processing.new(CropsterClient).processings({})
#### Get a Processing (roast)
    Cropster::Processing.new(CropsterClient).processing("ID")

### Projects
#### List Projects
    Cropster::Project.new(CropsterClient).projects({})
#### Get a Project
    Cropster::Project.new(CropsterClient).project("ID")

### Varieties
#### List Varieties
    Cropster::Variety.new(CropsterClient).varieties({})
#### Get a Variety
    Cropster::Variety.new(CropsterClient).variety("ID")

## Contributing

1. Fork it ( https://github.com/[my-github-username]/cropster/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
