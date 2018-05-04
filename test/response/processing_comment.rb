require 'test_helper'

class Cropster::Response::ProcessingCommentTest < Test::Unit::TestCase
  def test_initialize
    def test_initialize
      comment = Cropster::Response::ProcessingComment.new(valid_response)
      assert_match(/turningPoint/, comment.event)
      assert_not_nil comment.created_at
      assert_not_nil comment.time
      assert_match(/Foo Bar/, comment.note)

    end

    def valid_response
      {
        "type": "processingComments",
        "id": "AA",
        "attributes": {
          "note": "Foo Bar",
          "createdDate": 1302585664000,
          "time": 147001,
          "event": "turningPoint"
        },
        "relationships": {
          "processing": {
            "links": {
              "related": "https://c-sar.cropster.com/api/v2/processingComments/AA/processing"
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
end
