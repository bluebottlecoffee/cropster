##
# Provide an interface to the Cropster API SourceContact system
#
# https://cropstercore.docs.apiary.io/#reference/production-&-lots/sourcecontacts
#
module Cropster
  class SourceContact < Cropster::Base
    # Find a single SourceContact
    # @param id [String] the id of the required SourceContact
    # @return [Cropster::Response::SourceContact]
    def source_contact(id)
      find_by_id("source_contacts", id).first
    end

    # Find a collection of SourceContact objects
    # @param opts [Hash] options to filter the request
    # @return [Array] of Cropster::Response::SourceContact objects
    # def source_contacts(opts={})
    #   find_collection("source_contacts", opts)
    # end

    # Process the response from Cropster into appriate objects
    # @param response [Typhoeus::Response]
    def process(response)
      Cropster::Response::ResponseHandler.
        new("SourceContact", data_set(response)).compiled_data
    end
  end
end
