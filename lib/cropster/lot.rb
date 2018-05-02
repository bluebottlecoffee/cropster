##
# Provides an interface to the Cropster API Lot system
#
# https://cropstercore.docs.apiary.io/#reference/production-&-lots/lot
#
module Cropster
  class Lot < Cropster::Base

    # Find a single Lot
    # @param id [String] the id of the required Lot
    # @return [Cropster::Response::Lot]
    def lot(id)
      find_by_id("lots", id).first
    end

    # Find a collection of Lot objects
    # @param opts [Hash] options to filter the request
    # @return [Array] of Cropster::Response::Lot objects
    def lots(opts={})
      find_collection("lots", opts)
    end

    def create_lot(data)
      create("lots", data).first
    end

    # Create a new Lot on Cropster
    # @params data [Hash 

    # Process the response from Cropster into appriate objects
    # @param response [Typhoeus::Response]
    def process(response)
      Cropster::Response::ResponseHandler.
        new("Lot", data_set(response)).compiled_data
    end
  end
end
