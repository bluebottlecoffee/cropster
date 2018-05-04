##
# Provides an interface to the Cropster API GroupMembership system
#
# https://cropstercore.docs.apiary.io/#reference/accounts/group-memberships
#
module Cropster
  class GroupMembership < Cropster::Base
    # Find a single group_membership
    #
    # @param id [String] the id of the required group_membership
    # @return [Cropster::Response::GroupMembership]
    def group_membership(id)
      find_by_id("group_memberships", id).first
    end

    # Find a collection of group_membership objects
    #
    # @param opts [Hash] options to filter the request
    # @return [Array] of Cropster::Response::GroupMembership objects
    def group_memberships(opts={})
      find_collection("group_memberships", opts)
    end

    # Process the response from Cropster into appriate objects
    #
    # @param response [Typhoeus::Response]
    def process(response)
      Cropster::Response::ResponseHandler.
        new("GroupMembership", data_set(response)).compiled_data
    end

  end
end
