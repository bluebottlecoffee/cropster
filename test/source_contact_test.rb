require 'test_helper'

class Cropster::SourceContactTest < Test::Unit::TestCase
  def test_source_contact_success
    register_fixtures
    load_fixture(:source_contact_success)
    source_contact = Cropster::SourceContact.new(cropster_client).source_contact("AA")
    assert_match(/AA/, source_contact.id)
  end

  def register_fixtures
    url = fixture_url("source_contacts/AA")
    register_fixture(:source_contact_success, :get, url, "get_source_contact_success.json")
  end
end
