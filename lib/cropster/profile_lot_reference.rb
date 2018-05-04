##
# Provides an interface to the Cropster API ProfileLotReference system
#
# https://cropstercore.docs.apiary.io/#reference/production-&-lots/profile-lot-references
#
module Cropster
  class ProfileLotReference < Cropster::Base
    # Find a single ProfileLotReference
    #
    # @param id [String] the id of the required ProfileLotReference
    # @return [Cropster::Response::ProfileLotReference]
    def profile_lot_reference(id)
      find_by_id("profile_lot_references", id).first
    end

    # Find a collection of ProfileLotReference objects
    #
    # @param opts [Hash] options to filter the request
    # @return [Array] of Cropster::Response::ProfileLotReference objects
    def profile_lot_references(opts={})
      find_collection("profile_lot_references", opts)
    end

    # POSTs a new ProfileLotReference to the API
    #
    # @param data [Hash] the new ProfileLotReference
    # @return [Cropster::Response::ProfileLotReference]
    def create_profile_lot_reference(data)
      create("profile_lot_references", data).first
    end

    # Process the response from Cropster into appriate objects
    #
    # @param response [Typhoeus::Response]
    def process(response)
      Cropster::Response::ResponseHandler.
        new("ProfileLotReference", data_set(response)).compiled_data
    end
  end
end
