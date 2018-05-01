require 'test_helper'

class Cropster::LocationTest < Test::Unit::TestCase
  def test_location_success
    register_fixtures
    load_fixture(:location_success)
    location = Cropster::Location.new(cropster_client).location("AA")
    assert_equal "My Warehouse", location.name
    assert_match(/101 My Street/, location.street)
    assert_match(/11001/, location.zip)
    assert_match(/My City/, location.city)
    assert_match(/US/, location.country)
  end

  def test_locations_success
    register_fixtures
    load_fixture(:locations_success)
    locations = Cropster::Location.new(cropster_client).locations
    assert_equal 1, locations.length
  end

  def register_fixtures
    url = "https://foo:bar@private-anon-e2e6946d27-cropstercore.apiary-mock.com/api/v2/locations/AA"
    register_fixture(:location_success, :get, url, "location_success.json")
    url = "https://foo:bar@private-anon-e2e6946d27-cropstercore.apiary-mock.com/api/v2/locations?filter[locations][group]=CROR"
    register_fixture(:locations_success, :get, url, "locations_success.json")
  end
end
