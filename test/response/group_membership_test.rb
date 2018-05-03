require 'test_helper'

class Cropster::Response::GroupMembershipTest < Test::Unit::TestCase
  def test_initialize
    group_membership = Cropster::Response::GroupMembership.new(valid_response)
    assert_not_nil group_membership
    assert_not_nil group_membership.created_at
  end

  def valid_response
{
    "type": "groupMemberships",
    "id": "AA",
    "attributes": {
      "createdDate": "12345678900"
    },
    "relationships": {
      "user": {
        "links": {
          "self": "https://c-sar.cropster.com/api/v2/groupMemberships/AA/relationships/user",
          "related": "https://c-sar.cropster.com/api/v2/groupMemberships/AA/user"
        },
        "data": {
          "type": "users",
          "id": "AA"
        }
      },
      "group": {
        "links": {
          "self": "https://c-sar.cropster.com/api/v2/groupMemberships/AA/relationships/group",
          "related": "https://c-sar.cropster.com/api/v2/groupMemberships/AA/group"
        },
        "data": {
          "type": "groups",
          "id": "CROR"
        }
      },
      "permissions": {
        "links": {
          "self": "https://c-sar.cropster.com/api/v2/groupMemberships/AA/relationships/permissions",
          "related": "https://c-sar.cropster.com/api/v2/groupMemberships/AA/permissions"
        },
        "data": [
          {
            "type": "permissions",
            "id": "AA"
          },
          {
            "type": "permissions",
            "id": "BB"
          }
        ]
      }
    },
    "links": {
      "self": "https://c-sar.cropster.com/api/v2/groupMemberships/AA"
    }
  }
  end
end
