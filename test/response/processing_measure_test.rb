require 'test_helper'

class Cropster::Response::ProcessingMeasureTest < Test::Unit::TestCase
  def test_initialize
    measure = Cropster::Response::ProcessingMeasure.new(valid_response)
    assert_match(/chargeTemperature/, measure.name)
    assert_match(/FAHRENHEIT/, measure.unit)
    assert_equal 411.9, measure.amount
  end

  def valid_response
    {
      "type": "processingMeasures",
      "id": "AA",
      "attributes": {
        "name": "chargeTemperature",
        "measure": {
          "amount": 411.9,
          "unit": "FAHRENHEIT"
        }
      },
      "relationships": {
        "processing": {
          "links": {
            "related": "https://c-sar.cropster.com/api/v2/processingMeasures/AA/processing"
          },
          "data": {
            "type": "processings",
            "id": "AA"
          }
        }
      }
    }
  end
end
