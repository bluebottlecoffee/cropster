##
# Provides an interface to the Cropster API Contact system
#
# https://cropstercore.docs.apiary.io/#reference/general/contacts
#
module Cropster
  class Contact < Cropster::Base
    # Find a single contact
    # @param id [String] the id of the required object
    # @return [Cropster::Response::Contact]
    def contact(id)
      find_by_id("contacts", id).first
    end

    # Find a collection of Contact objects
    # @param opts [Hash] options to filter the request
    # @return [Array] of Cropster::Response::Contact objects
    def contacts(opts={})
      find_collection("contacts", opts)
    end

    # Process the response from Cropster into appriate objects
    # @param response [Typhoeus::Response]
    def process(response)
      Cropster::Response::ResponseHandler.
        new("Contact", data_set(response)).compiled_data
    end
  end
end
