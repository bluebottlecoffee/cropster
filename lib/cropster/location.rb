##
# Provides an interface to the Cropster API Location system
#
# https://cropstercore.docs.apiary.io/#reference/general/locations
#
module Cropster
  class Location < Cropster::Base

    # Find a single Location
    #
    # @param id [String] the id of the required Location
    # @return [Cropster::Response::Location]
    def location(id)
      find_by_id("locations", id).first
    end

    # Find a collection of Location objects
    #
    # @params opts [Hash] options to filter the request
    # @return [Array] of Cropster::Response::Location objects
    def locations(opts={})
      find_collection("locations", opts)
    end

    # Create a new Location
    #
    # @params opts [Hash] the new Location attributes
    # @return [Cropster::Response::Location]
    def create_location(data)
      create("locations", data).first
    end

    # Update an existing Lot
    #
    # @param id [String] the ID of the Location to be updates
    # @param data [Hash] containing the fields to be updates
    # @return [Cropster::Response::Location]
    def update_location(id, data)
      update("locations", id, data).first
    end

    # Process the response from Cropster into appriate objects
    #
    # @param response [Typhoeus::Response]
    def process(response)
      Cropster::Response::ResponseHandler.
        new("Location", data_set(response)).compiled_data
    end
  end
end
