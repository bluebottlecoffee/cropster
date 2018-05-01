require 'test_helper'

class Cropster::LotTest < Test::Unit::TestCase
  def setup
  end

  def test_initialize
    lot = Cropster::Lot.new(cropster_client)
    assert_not_nil lot
    assert_equal "Cropster::Client", lot.client.class.to_s
  end

  def test_lot_success
    register_lot_fixtures
    @manager = WebMock::Fixtures::Manager.run([:lot_success])
    lot = Cropster::Lot.new(cropster_client).lot("AA")
    assert_equal "Ethiopia Yirgacheffe", lot.name
    assert lot.weight.is_a?(Cropster::Response::Weight)
  end

  def test_lots_success
    register_lots_fixtures
    load_fixture(:lots_success)
    lots = Cropster::Lot.new(cropster_client).lots
    assert_equal 1, lots.length
  end

  def test_lots_failure
    register_lots_fixtures
    load_fixture(:lots_failure)
    assert_raise Cropster::Client::ServiceUnavailableError do
      lots = Cropster::Lot.new(cropster_client).lots
    end
  end

  def register_lot_fixtures
    url = "https://foo:bar@private-anon-e2e6946d27-cropstercore.apiary-mock.com/api/v2/lots/AA"
    WebMock::Fixtures::Manager.register_fixture_file(
      :lot_success, :get, url, "test/fixtures/lot_success.json"
    )
  end

  def register_lots_fixtures
    url = "https://foo:bar@private-anon-e2e6946d27-cropstercore.apiary-mock.com/api/v2/lots?filter[lots][group]=CROR"
    WebMock::Fixtures::Manager.register_fixture_file(
      :lots_success, :get, url, "test/fixtures/lots_success.json"
    )
    WebMock::Fixtures::Manager.register_fixture_file(
      :lots_failure, :get, url, 'test/fixtures/lots_failure.json'
    )
  end
end
