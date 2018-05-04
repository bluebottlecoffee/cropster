##
# Provides an interface to the Cropster API User system
#
# https://cropstercore.docs.apiary.io/#reference/accounts/user
#
module Cropster
  class User < Cropster::Base
    # Find a single user
    #
    # @param id [String] the id of the required user
    # @return [Cropster::Response::user]
    def user(id)
      find_by_id("users", id).first
    end

    # Find a collection of user objects
    #
    # @param opts [Hash] options to filter the request
    # @return [Array] of Cropster::Response::user objects
    def users(opts={})
      find_collection("users", opts)
    end

    # Process the response from Cropster into appriate objects
    #
    # @param response [Typhoeus::Response]
    def process(response)
      Cropster::Response::ResponseHandler.
        new("User", data_set(response)).compiled_data
    end
  end
end
