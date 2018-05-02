require 'test_helper'

class Cropster::ClientTest < Test::Unit::TestCase
  def setup
  end

  def test_initialize
    client = cropster_client

    assert_not_nil client
    assert_equal "foo", client.api_key
    assert_equal "bar", client.api_secret
    assert_equal "CROR", client.group_code
  end
end
