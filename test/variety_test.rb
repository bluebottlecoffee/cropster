require 'test_helper'

class Cropster::VarietyTest < Test::Unit::TestCase
  def test_variety_success
    register_fixtures
    load_fixture(:get_variety_success)
    variety = Cropster::Variety.new(cropster_client).variety("YB")
    assert_match(/YB/, variety.id)
  end

  def test_varieties_success
    register_fixtures
    load_fixture(:get_varieties_success)
    varieties = Cropster::Variety.new(cropster_client).varieties
    assert_equal 1, varieties.length
    assert_match(/YB/, varieties.first.id)
  end

  def register_fixtures
    url = fixture_url("varieties/YB")
    register_fixture(:get_variety_success, :get, url)

    url = fixture_url("varieties?filter[varieties][group]=CROR")
    register_fixture(:get_varieties_success, :get, url)
  end
end
