require "test_helper"

class LocationTest < Minitest::Test
  def test_initialize_with_attributes_hash
    location = Cropster::Response::Location.new({'id' => 1, 'name' => 'foo'})
    assert_equal 1, location.id
    assert_equal 'foo', location.name
  end

  def test_initialize_with_nil
    location = Cropster::Response::Location.new(nil)
    assert_equal 0, location.id
    assert_nil location.name
  end
end
