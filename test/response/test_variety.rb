require 'test_helper'

class Cropster::Response::VarietyTest < Test::Unit::TestCase
  def test_initialize
    variety = Cropster::Response::Variety.new(valid_response)
    assert_match(/YB/, variety.id)
    assert_match(/Bourbon/, variety.name)
    assert_match(/varieties/, variety.type)
    assert_match(/coffee/, variety.product_type)
  end

  def valid_response
    {
      "type": "varieties",
      "id": "YB",
      "attributes": {
        "name": "Bourbon",
        "productType": "coffee"
      },
      "links": {
        "self": "https://c-sar.cropster.com/api/v2/varieties/YB"
      }
    }
  end
end
