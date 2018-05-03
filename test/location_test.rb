require 'test_helper'

class Cropster::LocationTest < Test::Unit::TestCase
  def test_location_success
    register_fixtures
    load_fixture(:get_location_success)
    location = Cropster::Location.new(cropster_client).location("AA")
    assert_equal "My Warehouse", location.name
  end

  def test_locations_success
    register_fixtures
    load_fixture(:get_locations_success)
    locations = Cropster::Location.new(cropster_client).locations
    assert_equal 1, locations.length
  end

  def test_create_location_success
    register_fixtures
    load_fixture(:post_location_success)
    location = Cropster::Location.new(cropster_client).create_location(valid_post_data)
    assert_not_nil location
    assert_match(/My Warehouse/, location.name)
  end

  def test_update_location_success
    register_fixtures
    load_fixture(:patch_location_success)
    location = Cropster::Location.new(cropster_client).update_location("AA", valid_patch_data)
    assert_not_nil location
    assert_match(/My Warehouse/, location.name)
  end

  def register_fixtures
    url = fixture_url("locations/AA")
    register_fixture(:get_location_success, :get, url)
    url = fixture_url("locations?filter[locations][group]=CROR")
    register_fixture(:get_locations_success, :get, url)
    url = fixture_url("locations/")
    register_fixture(:post_location_success, :post, url)
    url = fixture_url("locations/AA")
    register_fixture(:patch_location_success, :patch, url)
  end

  def valid_patch_data
    {
      "id": "AA",
      "attributes": {
        "name": "My Warehouse",
        "street": "101 My Street",
        "zip": "11001",
        "city": "My City",
        "country": "US"
      }
    }
  end

  def valid_post_data
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
        }
      }
    }
  end
end
