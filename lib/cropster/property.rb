##
# Provides an interface to the Cropster API Property system
#
# https://cropstercore.docs.apiary.io/#reference/accounts/properties
#
module Cropster
  class Property < Cropster::Base
    # Find a single property
    #
    # @param id [String] the id of the required property
    # @return [Cropster::Response::Property]
    def property(id)
      find_by_id("properties", id).first
    end

    # Find a collection of property objects
    #
    # @param opts [Hash] options to filter the request
    # @return [Array] of Cropster::Response::Property objects
    def propertys(opts={})
      find_collection("properties", opts)
    end

    # Process the response from Cropster into appriate objects
    #
    # @param response [Typhoeus::Response]
    def process(response)
      Cropster::Response::ResponseHandler.
        new("Property", data_set(response)).compiled_data
    end

  end
end
