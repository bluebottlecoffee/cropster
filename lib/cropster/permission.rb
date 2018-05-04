##
# Provides and interface to the Cropster API Permission system
#
# https://cropstercore.docs.apiary.io/#reference/accounts/permissions
#
module Cropster
  class Permission < Cropster::Base
    # Find a single permission
    #
    # @param id [String] the id of the required permission
    # @return [Cropster::Response::Permission]
    def permission(id)
      find_by_id("permissions", id).first
    end

    # Find a collection of permission objects
    #
    # @param opts [Hash] options to filter the request
    # @return [Array] of Cropster::Response::Permission objects
    def permissions(opts={})
      find_collection("permissions", opts)
    end

    # Process the response from Cropster into appriate objects
    #
    # @param response [Typhoeus::Response]
    def process(response)
      Cropster::Response::ResponseHandler.
        new("Permission", data_set(response)).compiled_data
    end
  end
end
