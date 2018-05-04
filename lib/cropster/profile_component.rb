##
# Provides an interface to the Cropster API ProfileComponentComponent system
#
# https://cropstercore.docs.apiary.io/#reference/production-&-lots/profile-components
#
module Cropster
  class ProfileComponentComponent < Cropster::Base
    # Find a single ProfileComponent
    #
    # @param id [String] the id of the required ProfileComponent
    # @return [Cropster::Response::ProfileComponent]
    def profile_component(id)
      find_by_id("profile_components", id).first
    end

    # Find a collection of ProfileComponent objects
    #
    # @param opts [Hash] options to filter the request
    # @return [Array] of Cropster::Response::ProfileComponent objects
    def profile_components(opts={})
      find_collection("profile_components", opts)
    end

    # Process the response from Cropster into appriate objects
    #
    # @param response [Typhoeus::Response]
    def process(response)
      Cropster::Response::ResponseHandler.
        new("ProfileComponent", data_set(response)).compiled_data
    end
  end
end
