require 'test_helper'

class Cropster::ContactTest < Test::Unit::TestCase
  def test_contact_success
    register_contact_fixture
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
    register_contacts_fixtures
    load_fixture(:contacts_success)
    contacts = Cropster::Contact.new(cropster_client).contacts
    assert_equal 1, contacts.length
  end

  def register_contact_fixture
    url = "https://foo:bar@private-anon-e2e6946d27-cropstercore.apiary-mock.com/api/v2/contacts/AA"
    WebMock::Fixtures::Manager.register_fixture_file(
      :contact_success, :get, url, "test/fixtures/contact_success.json"
    )
  end
  def register_contacts_fixtures
    url = "https://foo:bar@private-anon-e2e6946d27-cropstercore.apiary-mock.com/api/v2/contacts?filter[contacts][group]=CROR"
    WebMock::Fixtures::Manager.register_fixture_file(
      :contacts_success, :get, url, "test/fixtures/contacts_success.json"
    )
  end
end
