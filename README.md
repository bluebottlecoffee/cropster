| ❗        | The End-of-Life and End-of-Support date for this product is July 23, 2021 (2021-07-23). Contributions made after this date will not be considered. |
|---------------|:------------------------|

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

    CropsterClient = Cropster::Client.new(
                  :client_username => ENV['CROPSTER_USERNAME'], 
                  :client_password => ENV['CROPSTER_PASSWORD'],
                  :group_code => ENV['CROPSTER_GROUP_CODE'])
                  

## Usage

###Green Lots Request

    CropsterClient.green_lots

###Green Lots Response

    [{"id"=>632684,
      "idTag"=>"PG-0036",
      "name"=>"Ethiopia ORG Sidamo Suke Quto",
      "location"=>{"id"=>55789, "name"=>"Some Location"},
      "creationDate"=>1399379937000,
      "project"=>{"id"=>3076, "name"=>"Ethiopian Washed Blender BC-WETH"},
      "weight"=>{"amount"=>7.141, "unit"=>"BAG60KG"}},
     {"id"=>630173,
      "idTag"=>"PG-0064",
      "name"=>"Peru ORG Perene River",
      "location"=>{"id"=>55789, "name"=>"Some Location"},
      "creationDate"=>1399306071000,
      "project"=>{"id"=>3293, "name"=>"Iced BC-ICED"},
      "weight"=>{"amount"=>17.086, "unit"=>"BAG69KG"}}]
      
###Roasted Lots Request
    
    CropsterClient.roasts
    
###Roasted Lots Response
    
    [{"id"=>669245,
      "idTag"=>"PR-10237",
      "name"=>"Costa Rica Vista el Valle Zapote",
      "location"=>{"id"=>55789, "name"=>"Some Location"},
      "creationDate"=>1401121036000,
      "project"=>{"id"=>3289, "name"=>"Costa Rica SO"},
      "weight"=>{"amount"=>30.0, "unit"=>"LBS"}},
     {"id"=>669220,
      "idTag"=>"PR-10236",
      "name"=>"Retrofit IV NYC",
      "location"=>{"id"=>55789, "name"=>"Some Location"},
      "creationDate"=>1401120213000,
      "project"=>nil,
      "weight"=>{"amount"=>48.0, "unit"=>"LBS"}}]
      
###Example Optional Params
    CropsterClient.green_lots({page: 1, perPage: 200, locationId: 55789})
*perPage max is 200

## Contributing

1. Fork it ( https://github.com/[my-github-username]/cropster/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
