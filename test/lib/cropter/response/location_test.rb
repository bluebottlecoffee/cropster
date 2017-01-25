require './lib/cropster/response/location'
require "minitest/autorun"

class LocationTest < Minitest::Test
  def test_initialize_with_attributes_hash
    location = Cropster::Response::Location.new({'id' => 1, 'name' => 'foo'})
    assert_equal location.id, 1
    assert_equal location.name, 'foo'
  end

  def test_initialize_with_nil
    location = Cropster::Response::Location.new(nil)
    assert_equal location.id, 0
    assert_nil location.name
  end
end
