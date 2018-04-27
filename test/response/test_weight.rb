require 'test_helper'

class Cropster::Response::WeightTest < Test::Unit::TestCase
  def test_with_valid_data
    weight = Cropster::Response::Weight.new(valid_data)
    assert_equal 3.5, weight.amount
    assert_equal "KG", weight.unit
  end

  def test_with_missing_amount
    weight = Cropster::Response::Weight.new(missing_amount)
    assert_equal 0, weight.amount
    assert_equal "KG", weight.unit
  end

  def test_grams_with_metric
    weight = Cropster::Response::Weight.new(valid_data)
    assert_equal 3500, weight.grams
    assert_equal 7, weight.pounds.to_i
  end

  def test_grams_with_pounds
    weight = Cropster::Response::Weight.new(valid_data_in_pounds)
    assert_equal 3.5, weight.pounds
    assert_equal 1587, weight.grams.to_i
  end

  def valid_data
    {
      "amount": 3.5,
      "unit": "KG"
    }
  end

  def valid_data_in_pounds
    {
      "amount": 3.5,
      "unit": "LBS"
    }
  end

  def missing_amount
    {
      "unit": "KG"
    }
  end
end
