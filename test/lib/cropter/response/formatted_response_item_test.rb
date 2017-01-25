require "test_helper"

class FormattedResponseItem < Minitest::Test
  def setup
    @response = Cropster::Response::FormattedResponseItem.new({
      'name' => 'Foo [123]'
    })
  end

  def test_ico_with_brackets
    assert_equal '123', @response.ico
  end
end
