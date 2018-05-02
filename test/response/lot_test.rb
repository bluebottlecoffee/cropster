require 'test_helper'

class Cropster::Response::LotTest < Test::Unit::TestCase
  def test_initialize
    item = Cropster::Response::Lot.new(valid_response)
    assert_equal "AA", item.id
    assert_equal "PR-0101", item.id_tag
    assert_equal "lots", item.type
    assert_not_nil item.created_at
    assert_not_nil item.consumed_at
    assert_equal 3.5, item.weight.amount
    assert_equal 220, item.initial_weight.amount
    assert_equal "AAA", item.grade
    assert_match(/coffee from our new partner/, item.notes)
    assert_equal "PO-1234", item.purchase_order_number
    assert_equal "KP923874", item.tracking_number
    assert_match(/Ethiopia/, item.name)
    assert_equal 4, item.price.amount
    assert_equal "LBS", item.price.base_unit
    assert_equal "USD", item.price.currency
    assert_equal ["AA"], item.varieties
    assert_equal ["CROR"], item.groups
    assert_equal ["ORIJ"], item.sensorial_qcs
    assert_equal ["AA"], item.processings
    assert_equal "https://c-sar.cropster.com/api/v2/lots/AA", item.link
  end

  def valid_response
    {
      "type": "lots",
      "id": "AA",
      "attributes": {
        "isSample": false,
        "creationDate": 1373858900000,
        "consumedDate": 1483858900000,
        "initialWeight": {
          "amount": 220,
          "unit": "KG"
        },
        "actualWeight": {
          "amount": 3.5,
          "unit": "KG"
        },
        "accepted": "notRated",
        "name": "Ethiopia Yirgacheffe",
        "idTag": "PR-0101",
        "trackingNumber": "KP923874",
        "price": {
          "amount": 4,
          "currency": "USD"
        },
        "priceBaseUnit": {
          "amount": 1,
          "unit": "LBS"
        },
        "salesNumber": "TR-16-12244",
        "grade": "AAA",
        "notes": "First coffee from our new partner",
        "processingStep": "coffee.roasting",
        "purchaseOrderNumber": "PO-1234"
      },
      "relationships": {
        "sourceContacts": {
          "links": {
            "self": "https://c-sar.cropster.com/api/v2/lots/AA/relationships/sourceContacts",
            "related": "https://c-sar.cropster.com/api/v2/lots/AA/sourceContacts"
          }
        },
        "latestSensorialQc": {
          "links": {
            "self": "https://c-sar.cropster.com/api/v2/lots/AA/relationships/latestSensorialQc",
            "related": "https://c-sar.cropster.com/api/v2/lots/AA/latestSensorialQc"
          },
          "data": {
            "type": "sensorialQcs",
            "id": "ORIJ"
          }
        },
        "project": {
          "links": {
            "self": "https://c-sar.cropster.com/api/v2/lots/AA/relationships/project",
            "related": "https://c-sar.cropster.com/api/v2/lots/AA/project"
          }
        },
        "variety": {
          "links": {
            "self": "https://c-sar.cropster.com/api/v2/lots/AA/relationships/variety",
            "related": "https://c-sar.cropster.com/api/v2/lots/AA/variety"
          },
          "data": {
            "type": "varieties",
            "id": "AA"
          }
        },
        "group": {
          "links": {
            "self": "https://c-sar.cropster.com/api/v2/lots/AA/relationships/group",
            "related": "https://c-sar.cropster.com/api/v2/lots/AA/group"
          },
          "data": {
            "type": "groups",
            "id": "CROR"
          }
        },
        "certificates": {
          "links": {
            "self": "https://c-sar.cropster.com/api/v2/lots/AA/relationships/certificates",
            "related": "https://c-sar.cropster.com/api/v2/lots/AA/certificates"
          }
        },
        "alerts": {
          "links": {
            "self": "https://c-sar.cropster.com/api/v2/api/v2/lots/AA/relationships/alerts",
            "related": "https://c-sar.cropster.com/api/v2/api/v2/lots/AA/alerts"
          }
        },
        "location": {
          "links": {
            "self": "https://c-sar.cropster.com/api/v2/lots/AA/relationships/location",
            "related": "https://c-sar.cropster.com/api/v2/lots/AA/location"
          },
          "data": {
            "type": "locations",
            "id": "AA"
          }
        },
        "processing": {
          "data": {
            "id": "AA",
            "type": "processings"
          },
          "links": {
            "self": "https://c-sar.cropster.com/api/v2/lots/AA/relationships/processing",
            "related": "https://c-sar.cropster.com/api/v2/lots/AA/processing"
          }
        }
      },
      "links": {
        "self": "https://c-sar.cropster.com/api/v2/lots/AA"
      }
    }
  end
end
