require 'test_helper'

class Cropster::Response::ContactTest < Test::Unit::TestCase
  def test_initialize
    contact = Cropster::Response::Contact.new(valid_response)
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
    assert_equal ["CROR"], contact.groups
  end

  def valid_response
    {
      "type": "contacts",
    "id": "AA",
    "attributes": {
      "firstName": "John",
      "lastName": "Doe",
      "companyName": "One Aweseome Company Name",
      "name":  "One Aweseome Company Name",
      "street": "Street 1",
      "city": "Paris",
      "zip": "84569",
      "country": "FR",
      "phone":  "+1 123456",
      "mobile":  "+1 12345678",
      "fax":  "+1 123456-15",
      "email":  "john.doe@oneawesomecompanyname.com",
      "website":  "www.oneawesomecompanyname.com"
    },
    "relationships": {
      "group": {
        "links": {
          "self": "https://c-sar.cropster.com/api/v2/contacts/AA/relationships/group",
          "related": "https://c-sar.cropster.com/api/v2/contacts/AA/group"
        },
        "data": {
          "type": "groups",
          "id": "CROR"
        }
      },
      "contactRoles": {
        "links": {
          "self": "https://c-sar.cropster.com/api/v2/contacts/AA/relationships/contactRoles",
          "related": "https://c-sar.cropster.com/api/v2/contacts/AA/contactRoles"
        },
        "data": [
          { "type": "contactRoles", "id": "AA" },
          { "type": "contactRoles", "id": "BB" }
        ]
      }
    }
    }
 
  end
end
