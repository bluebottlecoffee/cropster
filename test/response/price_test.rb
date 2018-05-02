require 'test_helper'

class Cropster::Response::PriceTest < Test::Unit::TestCase
  def test_initialize
    price = Cropster::Response::Price.new(valid_data, valid_base_data)
    assert_equal 4, price.amount
    assert_equal "USD", price.currency
    assert_equal 1, price.base_amount
    assert_equal "LBS", price.base_unit
  end

  def valid_data
    {
      "amount": 4,
      "currency": "USD"
    }
  end

  def valid_base_data
    {
      "amount": 1,
      "unit": "LBS"
    }
  end
end
