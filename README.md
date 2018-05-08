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

    client = Cropster::Client.new({
      api_key:    ENV['CROPSTER_API_KEY'],
      api_secret: ENV['CROPSTER_API_SECRET'],
      group_code: ENV['CROPSTER_GROUP_CODE']
    })

Optional keys for the client initialization include:

    test_mode: (true | false)
    api_path: "api/v2"

## Usage

### Certificates
#### List Certificates
    Cropster::Certificate.new(client).certificates({})
#### Get a Certificate
    Cropster::Certificate.new(client).certificate("ID")
#### Create a Certificate
    Cropster::Certificate.new(client).create_certificat(certificate_data)
#### Update a Certificate
    Cropster::Certificate.new(client).
      update_certificate("ID", certificate_data)

### Contacts
#### List Contacts
    Cropster::Contact.new(client).contacts({})
#### Get a Contact
    Cropster::Contact.new(client).contact("ID")

### Groups
#### List Groups
    Cropster::Group.new(client).groups({})
#### Get a Group
    Cropster::Group.new(client).group("CROR")

### Locations
#### List Locations
    Cropster::Location.new(client).locations({})
#### Get a Location
    Cropster::Location.new(client).location("ID")

### Lots
#### Get a Lot
    Cropster::Lot.new(client).lot("ID")
#### List Lots
    Cropster::Lot.new(client).lots
#### Create a Lot
    Cropster::Lot.new(client).create_lot(lot_data)
#### Update a Lot
    Cropster::Lot.new(client).update_lot("ID", lot_data)

### Machines
#### Get a Machine
    Cropster::Machine.new(client).machine("ID")
#### List Machines
    Cropster::Machine.new(client).machines

### Processing
#### List Processings
    Cropster::Processing.new(client).processings({})
#### Get a Processing (roast)
    Cropster::Processing.new(client).processing("ID")

### Projects
#### List Projects
    Cropster::Project.new(client).projects({})
#### Get a Project
    Cropster::Project.new(client).project("ID")

### Source Contacts
#### Get a Source Contact
    Cropster::SourceContact.new(client).source_contact("ID")

### Varieties
#### List Varieties
    Cropster::Variety.new(client).varieties({})
#### Get a Variety
    Cropster::Variety.new(client).variety("ID")

## Contributing

1. Fork it ( https://github.com/[my-github-username]/cropster/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
