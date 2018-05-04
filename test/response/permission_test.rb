require 'test_helper'

class Cropster::Response::PermissionTest < Test::Unit::TestCase
  def test_initialize
    permission = Cropster::Response::Permission.new(valid_response)
    assert_match(/AA/, permission.id)
    assert_match(/showLots/, permission.name)
    assert_match(/permissions/, permission.type)
  end

  def valid_response
    {
      "type": "permissions",
      "id": "AA",
      "attributes": {
        "name": "showLots"
      },
      "links": {
        "self": "https://c-sar.cropster.com/api/v2/permissions/showLots"
      }
    }
  end
end
