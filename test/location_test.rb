require 'test_helper'

class Cropster::LocationTest < Test::Unit::TestCase
  def test_location_success
    register_fixtures
    load_fixture(:location_success)
    location = Cropster::Location.new(cropster_client).location("AA")
    assert_equal "My Warehouse", location.name
  end

  def test_locations_success
    register_fixtures
    load_fixture(:locations_success)
    locations = Cropster::Location.new(cropster_client).locations
    assert_equal 1, locations.length
  end

  def register_fixtures
    url = fixture_url("locations/AA")
    register_fixture(:location_success, :get, url, "get_location_success.json")
    url = fixture_url("locations?filter[locations][group]=CROR")
    register_fixture(:locations_success, :get, url, "get_locations_success.json")
  end
end
