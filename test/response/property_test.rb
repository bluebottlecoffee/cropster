require 'test_helper'

class Cropster::Response::PropertyTest < Test::Unit::TestCase
  def test_initialize
    property = Cropster::Response::Property.new(valid_response)
    assert_not_nil property
    assert_match(/group.weightUnit/, property.name)
    assert_match(/KG/, property.value)
  end

  def valid_response
    {
      "type": "properties",
      "id": "AA",
      "attributes": {
        "name": "group.weightUnit",
        "value": "KG"
      },
      "links": {
        "self": "https://c-sar.cropster.com/api/v2/properties/AA"
      },
      "relationships": {
        "user": {
          "links": {
            "self": "https://c-sar.cropster.com/api/v2/properties/AA/relationships/user",
            "related": "https://c-sar.cropster.com/api/v2/groups/AA/user"
          },
          "data": {
            "type": "users",
            "id": "AA"
          }
        },
        "group": {
          "links": {
            "self": "https://c-sar.cropster.com/api/v2/properties/AA/relationships/group",
            "related": "https://c-sar.cropster.com/api/v2/groups/AA/group"
          },
          "data": {
            "type": "groups",
            "id": "CROR"
          }
        }
      }
    }
  end
end
