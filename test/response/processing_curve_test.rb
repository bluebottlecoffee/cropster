require 'test_helper'

class Cropster::Response::ProcessingCurveTest < Test::Unit::TestCase
  def test_initialize
    curve = Cropster::Response::ProcessingCurve.new(valid_response)
    assert_match(/beanTemperature/, curve.name)
    assert_match(/FAHRENHEIT/, curve.unit)
    assert_equal 808, curve.duration
    assert_equal 4, curve.values.length
    assert_equal 411.9, curve.values.first[:value]

  end

  def valid_response
    {
      "type": "processingCurves",
      "id": "AA",
      "attributes": {
        "name": "beanTemperature",
        "duration": 808067,
        "unit": "FAHRENHEIT",
        "values": [
          {
            "time": 62,
            "value": 411.9
          },
          {
            "time": 1062,
            "value": 409.4
          },
          {
            "time": 2062,
            "value": 406.7
          },
          {
            "time": 3062,
            "value": 404
          }
        ]
      },
      "relationships": {
        "processing": {
          "links": {
            "related": "https://c-sar.cropster.com/api/v2/processingCurves/AA/processing"
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
