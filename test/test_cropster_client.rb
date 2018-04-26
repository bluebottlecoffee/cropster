require 'test_helper'

class Cropster::ClientTest < Test::Unit::TestCase

  def test_initialize
    client = Cropster::Client.new({ api_key: "foo",
                                    api_secret: "bar",
                                    test_mode: true })

    assert_not_nil client
  end

  def test_authentication_combines_key_and_secret
    client = Cropster::Client.new({ api_key: "foo",
                                    api_secret: "bar"})

    assert_equal "foo:bar", client.authentication
  end

end
