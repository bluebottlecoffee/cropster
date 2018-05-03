require 'test_helper'

class Cropster::Response::GroupTest < Test::Unit::TestCase
  def test_initialize
    group = Cropster::Response::Group.new(valid_response)
    assert_match(/Cropster Roasting/, group.name)
  end

  def valid_response
    {
      "type": "groups",
      "id": "CROR",
      "attributes": {
        "name": "Cropster Roasting"
      },
      "relationships": {
        "groupMemberships": {
          "links": {
            "self": "https://c-sar.cropster.com/api/v2/groups/CROR/relationships/groupMemberships",
            "related": "https://c-sar.cropster.com/api/v2/groups/CROR/groupMemberships"
          }
        }
      },
      "links": {
        "self": "https://c-sar.cropster.com/api/v2/groups/CROR"
      }
    }
  end
end
