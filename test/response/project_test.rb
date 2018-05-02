require 'test_helper'

class Cropster::Response::ProjectTest < Test::Unit::TestCase
  def test_initialize
    project = Cropster::Response::Project.new(valid_response)
    assert_match(/projects/, project.type)
    assert_match(/My Project/, project.name)
    assert_match(/More project details/, project.description)
    assert_equal(["CROR"], project.groups)
  end

  def valid_response
    {
      "type": "projects",
      "id": "AA",
      "attributes": {
        "name": "My Project",
        "description": "More project details",
        "isArchived": false
      },
      "relationships": {
        "group": {
          "data": {
            "type": "groups",
            "id": "CROR"
          }
        }
      }
    }
  end
end
