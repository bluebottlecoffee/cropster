require 'test_helper'

class Cropster::CertificateTest < Test::Unit::TestCase
  def test_certificate_success
    register_fixtures
    load_fixture(:get_certificate_success)
    certificate = Cropster::Certificate.new(cropster_client).certificate("n8K")
    assert_match(/n8K/, certificate.id)
  end

  def test_create_certificate_success
    register_fixtures
    load_fixture(:post_certificate_success)
    certificate = Cropster::Certificate.new(cropster_client).create_certificate(valid_post_data)
    assert_not_nil certificate
  end

  def test_patch_certificate_success
    register_fixtures
    load_fixture(:patch_certificate_success)
    certificate = Cropster::Certificate.new(cropster_client).update_certificate("n8K", valid_patch_data)
    assert_not_nil certificate
    assert_match(/Cup of Excellence/, certificate.name)
  end

  def register_fixtures
    url = fixture_url("certificates/n8K")
    register_fixture(:get_certificate_success, :get, url)
    url = fixture_url("certificates/")
    register_fixture(:post_certificate_success, :post, url)
    url = fixture_url("certificates/n8K")
    register_fixture(:patch_certificate_success, :patch, url)
  end

  def valid_post_data
    {
      "data": {
        "type": "certificates",
        "id": "n8K",
        "attributes": {
          "name": "Cup of Excellence"
        }
      }
    }
  end

  def valid_patch_data
    {
      "data": {
        "type": "certificates",
        "id": "n8K",
        "attributes": {
          "name": "Cup of Excellence"
        }
      }
    }
  end
end
