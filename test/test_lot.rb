require 'test_helper'

class Cropster::LotTest < Test::Unit::TestCase
  def test_initialize
    lot = Cropster::Lot.new(cropster_client)
    assert_not_nil lot
    assert_equal "Cropster::Client", lot.client.class.to_s
  end

  def test_lot_success
    register_fixtures
    load_fixture(:lot_success)
    lot = Cropster::Lot.new(cropster_client).lot("AA")
    assert_equal "Ethiopia Yirgacheffe", lot.name
    assert lot.weight.is_a?(Cropster::Response::Weight)
  end

  def test_lots_success
    register_fixtures
    load_fixture(:lots_success)
    lots = Cropster::Lot.new(cropster_client).lots
    assert_equal 1, lots.length
  end

  def test_lots_failure
    register_fixtures
    load_fixture(:lots_failure)
    assert_raise ServiceUnavailableError do
      Cropster::Lot.new(cropster_client).lots
    end
  end

  def register_fixtures
    url = fixture_url("lots/AA")
    register_fixture(:lot_success, :get, url, "lot_success.json")
    url = fixture_url("lots?filter[lots][group]=CROR")
    register_fixture(:lots_success, :get, url, "lots_success.json")
    register_fixture(:lots_failure, :get, url, 'lots_failure.json')
  end
end
