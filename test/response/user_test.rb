require 'test_helper'

class Cropster::Response::UserTest < Test::Unit::TestCase
  def test_initialize
    user = Cropster::Response::User.new(valid_data)
    assert_not_nil user
    assert_match(/John Doe/, user.name)
    assert_match(/test@cropster.com/, user.email)
    assert_match(/en_US/, user.locale)
    assert_match(/New_York/, user.timezone)
    assert user.active
  end

  def valid_data
    {
      "type": "users",
      "id": "gmJ8",
      "attributes": {
        "email": "test@cropster.com",
        "name": "John Doe",
        "locale": "en_US",
        "timezone": "America/New_York",
        "active": true
      },
      "relationships": {
        "groupMemberships": {
          "links": {
            "self": "https://c-sar.cropster.com/api/v2/users/AA/relationships/groupMemberships",
            "related": "https://c-sar.cropster.com/api/v2/users/AA/groupMemberships"
          }
        }
      },
      "links": {
        "self": "https://c-sar.cropster.com/api/v2/users/gmJ8"
      }
    }
  end
end
