require 'test_helper'

class Cropster::ClientTest < Test::Unit::TestCase
  def setup
    register_fixtures
  end

  def test_initialize
    client = cropster_client

    assert_not_nil client
    assert_equal "foo", client.api_key
    assert_equal "bar", client.api_secret
    assert_equal "CROR", client.group_code
  end

  def test_green_lots_success
    @manager = WebMock::Fixtures::Manager.run([:green_lots_success])
    stub = @manager[:green_lots_success]
    client = cropster_client
    lots = client.green_lots
    assert_equal 1, lots.length
  end

  def test_green_lots_failure
    WebMock::Fixtures::Manager.run([:green_lots_failure])
    assert_raise Cropster::Client::ServiceUnavailableError do
      client = cropster_client
      lots = client.green_lots
    end
  end

  def cropster_client
    Cropster::Client.new({ api_key: "foo",
                           api_secret: "bar",
                           test_mode: true,
                           group_code: 'CROR' })
  end

  def register_fixtures
    url = "https://foo:bar@private-anon-e2e6946d27-cropstercore.apiary-mock.com/api/v2/lots?filter%5Blots%5D%5Bgroup%5D=CROR"
    WebMock::Fixtures::Manager.register_fixture_file(
      :green_lots_success, :get, url, "test/fixtures/green_lots_success.json"
    )
    WebMock::Fixtures::Manager.register_fixture_file(
      :green_lots_failure, :get, url, 'test/fixtures/green_lots_failure.json'
    )
  end

end
