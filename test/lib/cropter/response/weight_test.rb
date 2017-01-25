require "test_helper"

class WeightTest < Minitest::Test
  def setup
    @weight = Cropster::Response::Weight.new({'amount' => 2.2, 'unit' => 'LBS'})
  end

  def test_amount
    assert_equal 2.2, @weight.amount
  end

  def test_unit
    assert_equal 'LBS', @weight.unit
  end

  def test_grams
    assert_equal BigDecimal.new(997.764614, 10), @weight.grams
  end

  def test_pounds
    assert_equal BigDecimal.new(2.2, 10), @weight.pounds
  end
end
