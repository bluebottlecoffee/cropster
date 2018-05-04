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

  def test_lots_by_ids_success
    register_fixtures
    load_fixture(:get_lots_by_ids_success)
    lots = Cropster::Lot.new(cropster_client).lots_by_ids("AA,BB")
    # assert_equal 2, lots.length
  end

  def test_create_lot_success
    register_fixtures
    load_fixture(:post_lot_success)
    lot = Cropster::Lot.new(cropster_client).create_lot(valid_post_data)
    assert_not_nil lot
    assert_match(/Yirgacheffe/, lot.name)
  end

  def test_update_lot_success
    register_fixtures
    load_fixture(:patch_lot_success)
    lot = Cropster::Lot.new(cropster_client).update_lot("0GQ", valid_patch_data)
    assert_not_nil lot
    assert_match(/Getting renamed/, lot.name)
  end

  def register_fixtures
    url = fixture_url("lots/AA")
    register_fixture(:get_lot_success, :get, url)
    url = fixture_url("lots?filter[lots][group]=CROR")
    register_fixture(:get_lots_success, :get, url)
    register_fixture(:get_lots_failure, :get, url)
    url = fixture_url("lots/AA,BB")
    register_fixture(:get_lots_by_ids_success, :get, url)
    url = fixture_url("lots/")
    register_fixture(:post_lot_success, :post, url)
    url = fixture_url("lots/0GQ")
    register_fixture(:patch_lot_success, :patch, url)
  end

  def valid_patch_data
    {
      "data": {
        "type": "lots",
        "id": "0GQ",
        "attributes": {
          "name": "Getting renamed",
          "accepted": "accepted"
        },
        "relationships": {
          "variety": {
            "data": {
              "type": "varieties",
              "id": "AA"
            }
          }
        }
      }
    }
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
