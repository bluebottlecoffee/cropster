require 'test_helper'

class Cropster::Response::ProfileTest < Test::Unit::TestCase
  def test_initialize
    profile = Cropster::Response::Profile.new(valid_response)
    assert_match(/AA/, profile.id)
    assert_match(/Dark Chocolate Blend/, profile.name)
    assert_equal -0.0735, profile.calculated_weight_change
    assert_equal -0.1, profile.weight_change
    assert profile.is_active
    refute profile.is_archived
    assert_not_nil profile.created_at
    assert_not_nil profile.last_modified_at
    assert_not_nil profile.profile_lot_references_last_modified_at
    assert_nil profile.batch_size
    assert_nil profile.erp_id
    assert_nil profile.new_lot_name
    assert_nil profile.notes
  end

  def valid_response
    {
      "type": "profiles",
      "id": "AA",
      "attributes": {
        "batchSize": nil,
        "calculatedWeightChange": -0.0735,
        "createdDate": 1302561695000,
        "erpId": nil,
        "isActive": true,
        "isArchived": false,
        "lastModifiedDate": 1348608863000,
        "name": "Dark Chocolate Blend",
        "newLotName": nil,
        "notes": nil,
        "profileLotReferencesLastModifiedDate": 1348608863000,
        "weightChange": -0.1
      },
      "relationships": {
        "profileLotReference": {
          "data": {
            "id": "AA",
            "type": "profileLotReferences"
          },
          "links": {
            "self": "https://c-sar.cropster.com/api/v2/profiles/AA/relationships/profileLotReference",
            "related": "https://c-sar.cropster.com/api/v2/profiles/AA/profileLotReference"
          }
        },
        "referenceLots": {
          "links": {
            "self": "https://c-sar.cropster.com/api/v2/profiles/AA/relationships/referenceLots",
            "related": "https://c-sar.cropster.com/api/v2/profiles/AA/referenceLots"
          }
        },
        "profileComponents": {
          "data": [
            {
              "id": "AA",
              "type": "profileComponents"
            }
          ],
          "links": {
            "self": "https://c-sar.cropster.com/api/v2/profiles/AA/relationships/profileComponents",
            "related": "https://c-sar.cropster.com/api/v2/profiles/AA/profileComponents"
          }
        },
        "project": {
          "data": nil,
          "links": {
            "self": "https://c-sar.cropster.com/api/v2/profiles/AA/relationships/project",
            "related": "https://c-sar.cropster.com/api/v2/profiles/AA/project"
          }
        },
        "referenceLot": {
          "data": {
            "id": "AA",
            "type": "lots"
          },
          "links": {
            "self": "https://c-sar.cropster.com/api/v2/profiles/AA/relationships/referenceLot",
            "related": "https://c-sar.cropster.com/api/v2/profiles/AA/referenceLot"
          }
        },
        "restrictedMachines": {
          "links": {
            "self": "https://c-sar.cropster.com/api/v2/profiles/AA/relationships/restrictedMachines",
            "related": "https://c-sar.cropster.com/api/v2/profiles/AA/restrictedMachines"
          }
        },
        "profileLotReferences": {
          "links": {
            "self": "https://c-sar.cropster.com/api/v2/profiles/AA/relationships/profileLotReferences",
            "related": "https://c-sar.cropster.com/api/v2/profiles/AA/profileLotReferences"
          }
        },
        "group": {
          "data": {
            "id": "CROR",
            "type": "groups"
          },
          "links": {
            "self": "https://c-sar.cropster.com/api/v2/profiles/AA/relationships/group",
            "related": "https://c-sar.cropster.com/api/v2/profiles/AA/group"
          }
        }
      },
      "links": {
        "self": "https://c-sar.cropster.com/api/v2/profiles/AA"
      }
    }
  end
end
