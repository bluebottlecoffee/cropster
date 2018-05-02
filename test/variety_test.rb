require 'test_helper'

class Cropster::VarietyTest < Test::Unit::TestCase
  def test_variety_success
    register_fixtures
    load_fixture(:variety_success)
    variety = Cropster::Variety.new(cropster_client).variety("YB")
    assert_match(/YB/, variety.id)
  end

  def test_varieties_success
    register_fixtures
    load_fixture(:varieties_success)
    varieties = Cropster::Variety.new(cropster_client).varieties
    assert_equal 1, varieties.length
    assert_match(/YB/, varieties.first.id)
  end

  def register_fixtures
    url = fixture_url("varieties/YB")
    register_fixture(:variety_success, :get, url, "variety_success.json")

    url = fixture_url("varieties?filter[varieties][group]=CROR")
    register_fixture(:varieties_success, :get, url, "varieties_success.json")
  end
end
