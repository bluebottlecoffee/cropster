require 'test_helper'

class Cropster::ClientTest < Test::Unit::TestCase
  def setup
    register_fixture
  end

  def test_initialize
    client = cropster_client

    assert_not_nil client
  end

  def test_authentication_combines_key_and_secret
    client = cropster_client

    assert_equal "foo:bar", client.authentication
  end

  def test_green_lots
    @manager = WebMock::Fixtures::Manager.run([:green_lots_success])
    # stub = @manager[:green_lots_success]
    # client = cropster_client
    # lots = client.green_lots
    # assert_equal 1, lots.length
  end

  def cropster_client
    Cropster::Client.new({ api_key: "foo",
                           api_secret: "bar",
                           test_mode: true,
                           group_code: 'CROR' })
  end

  def register_fixture
    url = "https://foo:bar@private-anon-e2e6946d27-cropstercore.apiary-mock.com/api/v2/lots?filter%5Blots%5D%5Bgroup%5D=CROR"
    WebMock::Fixtures::Manager.register_fixture_file(
      :green_lots_success, :get, url, "test/fixtures/green_lots_success.json"
    )
  end

end
