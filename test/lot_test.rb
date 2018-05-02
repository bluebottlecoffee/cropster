require 'test_helper'

class Cropster::LotTest < Test::Unit::TestCase
  def test_initialize
    lot = Cropster::Lot.new(cropster_client)
    assert_not_nil lot
    assert_equal "Cropster::Client", lot.client.class.to_s
  end

  def test_lot_success
    register_fixtures
    load_fixture(:get_lot_success)
    lot = Cropster::Lot.new(cropster_client).lot("AA")
    assert_equal "Ethiopia Yirgacheffe", lot.name
    assert lot.weight.is_a?(Cropster::Response::Weight)
  end

  def test_lots_success
    register_fixtures
    load_fixture(:get_lots_success)
    lots = Cropster::Lot.new(cropster_client).lots
    assert_equal 1, lots.length
  end

  def test_lots_failure
    register_fixtures
    load_fixture(:get_lots_failure)
    assert_raise ServiceUnavailableError do
      Cropster::Lot.new(cropster_client).lots
    end
  end

  def test_create_lot_success
    register_fixtures
    load_fixture(:post_lot_success)
    lot = Cropster::Lot.new(cropster_client).create_lot(valid_post_data)
    assert_not_nil lot
    assert_match(/Yirgacheffe/, lot.name)
  end

  def register_fixtures
    url = fixture_url("lots/AA")
    register_fixture(:get_lot_success, :get, url, "get_lot_success.json")
    url = fixture_url("lots?filter[lots][group]=CROR")
    register_fixture(:get_lots_success, :get, url, "get_lots_success.json")
    register_fixture(:get_lots_failure, :get, url, 'get_lots_failure.json')
    url = fixture_url("lots/")
    register_fixture(:post_lot_success, :post, url, "post_lot_success.json")
  end

  def valid_post_data
    {
      "data": {
        "type": "lots",
        "attributes": {
          "actualWeight": {
            "amount": 100,
            "unit": "KG"
          },
          "processingStep": "coffee.green",
          "name": "Yirgacheffe Test Sample",
          "isSample": true
        },
        "relationships": {
          "group": {
            "data": {
              "type": "groups",
              "id": "CROP"
            }
          }
        }
      }
    }
  end
end
