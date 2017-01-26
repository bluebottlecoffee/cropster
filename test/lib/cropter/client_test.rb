require "test_helper"

class ClientTest < Minitest::Test
  def setup
    @mock_response = Minitest::Mock.new
  end

  def test_green_lots
    @mock_response.expect(:code, 200)
    @mock_response.expect(:body, File.read('./test/fixtures/green_lots.json'))
    Typhoeus::Request.stub(:get, @mock_response) do
      lots = Cropster::Client.new.green_lots
      assert_equal lots.count, 1
      assert_equal lots.first.name, "Good Stuff [12-23]"
    end
  end

  def test_roast_batches
    @mock_response.expect(:code, 200)
    @mock_response.expect(:body, File.read('./test/fixtures/roast_batches.json'))
    Typhoeus::Request.stub(:get, @mock_response) do
      batches = Cropster::Client.new.roast_batches
      assert_equal batches.count, 1
      assert_equal batches.first.name, "Good Stuff [12-24]"
    end
    @mock_response.verify
  end

  def test_unauthorized_request
    response = Struct.new(:code).new(401)
    Typhoeus::Request.stub(:get, response) do
      Cropster::Client.new.roast_batches
    end
  rescue Cropster::Client::ServiceUnavailableError => e
    assert_equal e.message, "401"
  end

  def test_username_from_env
    ENV['CROPSTER_USERNAME'] = 'greggroth'
    assert_equal 'greggroth', Cropster::Client.new.client_username
    ENV.delete('CROPSTER_USERNAME')
  end

  def test_password_from_env
    ENV['CROPSTER_PASSWORD'] = 'pa5word'
    assert_equal 'pa5word', Cropster::Client.new.client_password
    ENV.delete('CROPSTER_PASSWORD')
  end

  def test_group_code_from_env
    ENV['CROPSTER_GROUP_CODE'] = '123'
    assert_equal '123', Cropster::Client.new.group_code
    ENV.delete('CROPSTER_GROUP_CODE')
  end
end
