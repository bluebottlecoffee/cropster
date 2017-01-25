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
end
