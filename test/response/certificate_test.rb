require 'test_helper'

class Cropster::Response::CertificateTest < Test::Unit::TestCase
  def test_initialize
    certificate = Cropster::Response::Certificate.new(valid_response)
    assert_match(/n8K/, certificate.id)
    assert_match(/Cup of Excellence/, certificate.name)
    assert_match(/certificates/, certificate.type)
  end

  def valid_response
    {
      "type": "certificates",
      "id": "n8K",
      "attributes": {
        "name": "Cup of Excellence"
      },
      "links": {
        "self": "https://c-sar.cropster.com/api/v2/certificates/n8K"
      }
    }
  end
end
