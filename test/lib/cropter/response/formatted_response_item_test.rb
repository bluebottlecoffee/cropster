require "test_helper"

class FormattedResponseItem < Minitest::Test
  def setup
    @response = Cropster::Response::FormattedResponseItem.new({})
  end

  def test_ico_with_brackets
    Cropster::Configuration.name_ico_separators = '[]'
    @response.name = 'Foo [123]'
    assert_equal '123', @response.ico
    @response.name = 'Foo [123-1]'
    assert_equal '123-1', @response.ico
    @response.name = 'Foo [*123-1]'
    assert_equal '*123-1', @response.ico
  end

  def test_ico_with_parenthesis
    Cropster::Configuration.name_ico_separators = '()'
    @response.name = 'Foo (123)'
    assert_equal '123', @response.ico
    @response.name = 'Foo (123-1)'
    assert_equal '123-1', @response.ico
  end

  def test_name_sans_ico
    Cropster::Configuration.name_ico_separators = '[]'
    @response.name = 'Foo [123]'
    assert_equal 'Foo', @response.name_sans_ico
  end
end
