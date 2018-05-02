require 'test_helper'

class Cropster::Response::MachineTest < Test::Unit::TestCase
  def test_machines_success
    machine = Cropster::Response::Machine.new(valid_response)
    assert_match(/machines/, machine.type)
    assert_match(/AA/, machine.id)
    assert_match(/My Machine/, machine.name)
    assert_match(/GIESEN_W1/, machine.machine_type)
    assert_equal 40, machine.capacity.amount

  end

  def valid_response
    {
      "type": "machines",
      "id": "AA",
      "attributes": {
        "name": "My Machine",
        "type": "GIESEN_W1",
        "capacity": {
          "amount": 40,
          "unit": "KG"
        },
        "measures": [
          "roastAreaIndex"
        ],
        "comments": [
          "firstCrack"
        ]
      },
      "relationships": {
        "group": {
          "links": {
            "self": "https://c-sar.cropster.com/api/v2/groups/CROR/machines",
            "related": "https://c-sar.cropster.com/api/v2/groups/CROR"
          },
          "data": {
            "type": "groups",
            "id": "CROR"
          }
        },
        "location": {
          "links": {
            "self": "https://c-sar.cropster.com/api/v2/groups/CROR/locations",
            "related": "https://c-sar.cropster.com/api/v2/CROR/machines/AA/location"
          },
          "data": {
            "type": "location",
            "id": "AA"
          }
        },
        "profiles": {
          "links": {
            "related": "https://c-sar.cropster.com/api/v2/CROR/machines/AA/profiles"
          },
          "data": [
            {
              "type": "profiles",
              "id": "AA"
            }
          ]
        },
        "lots": {
          "links": {
            "related": "https://c-sar.cropster.com/api/v2/CROR/machines/AA/lots"
          }
        }
      }
    }
  end
end
