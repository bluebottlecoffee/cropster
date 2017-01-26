require "test_helper"

class SourceTest < Minitest::Test
  def test_initialize_with_attributes_hash
    source = Cropster::Response::Source.new({'lot' => {}, 'weight' => {'amount' => 1, 'unit' => 'LBS'}})
    assert_equal 1, source.weight.amount
  end
end
