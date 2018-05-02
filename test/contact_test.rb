require 'test_helper'

class Cropster::ContactTest < Test::Unit::TestCase
  def test_contact_success
    register_fixtures
    load_fixture(:contact_success)
    contact = Cropster::Contact.new(cropster_client).contact("AA")
    assert_match(/John/, contact.first_name)
  end

  def test_contacts_success
    register_fixtures
    load_fixture(:contacts_success)
    contacts = Cropster::Contact.new(cropster_client).contacts
    assert_equal 1, contacts.length
  end

  def register_fixtures
    url = fixture_url("contacts/AA")
    register_fixture(:contact_success, :get, url, "contact_success.json")
    url = fixture_url("contacts?filter[contacts][group]=CROR")
    register_fixture(:contacts_success, :get, url, "contacts_success.json")
  end
end
