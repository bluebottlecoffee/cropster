require 'test_helper'

class Cropster::Response::LocationTest < Test::Unit::TestCase
  def test_initialize
    location = Cropster::Response::Location.new(valid_response)
    assert_equal "My Warehouse", location.name
    assert_match(/101 My Street/, location.street)
    assert_match(/11001/, location.zip)
    assert_match(/My City/, location.city)
    assert_match(/US/, location.country)
    assert_equal ["CROR"], location.groups
    assert_nil location.link
  end

  def valid_response
    {
      "type": "locations",
      "id": "AA",
      "attributes": {
        "name": "My Warehouse",
        "street": "101 My Street",
        "zip": "11001",
        "city": "My City",
        "country": "US"
      },
      "relationships": {
        "group": {
          "links": {
            "self": "https://c-sar.cropster.com/api/v2/groups/CROR/locations",
            "related": "https://c-sar.cropster.com/api/v2/groups/CROR"
          },
          "data": {
            "type": "groups",
            "id": "CROR"
          }
        },
        "lots": {
          "links": {
            "related": "https://c-sar.cropster.com/api/v2/CROR/locations/AA/lots"
          }
        }
      }
    }
  end
end
