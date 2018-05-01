require 'test_helper'

class Cropster::ContactTest < Test::Unit::TestCase
  def test_contact_success
    register_fixtures
    load_fixture(:contact_success)
    contact = Cropster::Contact.new(cropster_client).contact("AA")
    assert_match(/John/, contact.first_name)
    assert_match(/Doe/, contact.last_name)
    assert_match(/One Aweseome Company Name/, contact.company_name)
    assert_match(/One Aweseome Company Name/, contact.name)
    assert_match(/Street 1/, contact.street)
    assert_match(/Paris/, contact.city)
    assert_match(/84569/, contact.zip)
    assert_match(/FR/, contact.country)
    assert_match(/1 123456/, contact.phone)
    assert_match(/12345678/, contact.mobile)
    assert_match(/123456-15/, contact.fax)
    assert_match(/john.doe@/, contact.email)
    assert_match(/oneawesomecompanyname.com/, contact.website)
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
