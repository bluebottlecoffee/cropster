##
# Provides an interface to the Cropster API Group system
#
# https://cropstercore.docs.apiary.io/#reference/accounts/group

module Cropster
  class Group < Cropster::Base
    # Find a single group
    # @param id [String] the id of the required Group
    # return [Cropster::Response::Group]
    def group(id)
      find_by_id("groups", id).first
    end

    # Find a collection of Group objects
    # @param opts [Hash] options to filter the request
    # @return [Array] of Cropster::Response::Group objects
    def groups(opts={})
      find_collection("groups", opts)
    end

    # Process the response from Cropster into Cropster::Response::Groups
    # @param response [Typhoeus::Response]
    def process(response)
      Cropster::Response::ResponseHandler.
        new("Group", data_set(response)).compiled_data
    end
  end
end
