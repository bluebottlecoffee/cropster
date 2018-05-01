require 'test_helper'

class Cropster::VarietyTest < Test::Unit::TestCase
  def test_variety_success
    register_fixtures
    load_fixture(:variety_success)
    variety = Cropster::Variety.new(cropster_client).variety("YB")
    assert_match(/YB/, variety.id)
    assert_match(/Bourbon/, variety.name)
    assert_match(/varieties/, variety.type)
    assert_match(/coffee/, variety.product_type)
  end

  def test_varieties_success
    register_fixtures
    load_fixture(:varieties_success)
    varieties = Cropster::Variety.new(cropster_client).varieties
    assert_equal 1, varieties.length
  end

  def register_fixtures
    url = "https://foo:bar@private-anon-e2e6946d27-cropstercore.apiary-mock.com/api/v2/varieties/YB"
    register_fixture(:variety_success, :get, url, "variety_success.json")
    url = "https://foo:bar@private-anon-e2e6946d27-cropstercore.apiary-mock.com/api/v2/varieties?filter[varieties][group]=CROR"
    register_fixture(:varieties_success, :get, url, "varieties_success.json")
  end
end
