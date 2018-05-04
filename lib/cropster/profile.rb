##
# Provides an interface to the Cropster API Profile system
#
# https://cropstercore.docs.apiary.io/#reference/production-&-lots/profiles
#
module Cropster
  class Profile < Cropster::Base
    # Find a single Profile
    #
    # @param id [String] the id of the required Profile
    # @return [Cropster::Response::Profile]
    def profile(id)
      find_by_id("profiles", id).first
    end

    # Find a collection of Profile objects
    #
    # @param opts [Hash] options to filter the request
    # @return [Array] of Cropster::Response::Profile objects
    def profiles(opts={})
      find_collection("profiles", opts)
    end

    # Process the response from Cropster into appriate objects
    #
    # @param response [Typhoeus::Response]
    def process(response)
      Cropster::Response::ResponseHandler.
        new("Profile", data_set(response)).compiled_data
    end
  end
end
