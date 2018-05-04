##
# Provides an interface to the Cropster API Lot system
#
# https://cropstercore.docs.apiary.io/#reference/production-&-lots/lot
#
module Cropster
  class Lot < Cropster::Base

    # Find a single Lot
    #
    # @param id [String] the id of the required Lot
    # @return [Cropster::Response::Lot]
    def lot(id)
      find_by_id("lots", id).first
    end

    # Find a collection of Lot objects
    #
    # @param opts [Hash] options to filter the request
    # @return [Array] of Cropster::Response::Lot objects
    def lots(opts={})
      find_collection("lots", opts)
    end

    # Find multiple Lot objects by ID's
    #
    # @param ids [String] a comma separated string of ID's (eg "AA,BB")
    # @return [Array] of Cropster::Response::Lot objects
    def lots_by_ids(ids)
      find_by_ids("lots", ids)
    end

    # POSTs a new Lot to the API
    #
    # @param data [Hash] the new Lot
    # @return [Cropster::Response::Lot]
    def create_lot(data)
      create("lots", data).first
    end

    # Updates an existing lot, currently only supports updating 
    # @name and @accepted attributes.
    #
    # @param id [String] the ID of the Lot to be updated
    # @param data [Hash] containing the fields to be updated
    # @return [Cropster::Response::Lot]
    def update_lot(id, data)
      update("lots", id, data).first
    end

    # Process the response from Cropster into appriate objects
    #
    # @param response [Typhoeus::Response]
    def process(response)
      Cropster::Response::ResponseHandler.
        new("Lot", data_set(response)).compiled_data
    end
  end
end
