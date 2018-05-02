##
# Provides an interface to the Cropster API Variety system
#
# https://cropstercore.docs.apiary.io/#reference/production-&-lots/varieties
#
module Cropster
  class Variety < Cropster::Base
    # Find a single contact
    # @param id [String] the id of the required Variety
    # @return [Cropster::Response::Variety]
    def variety(id)
      find_by_id("varieties", id).first
    end

    # Find a collection of Variety objects
    # @param opts [Hash] options to filter the request
    # @return [Array] of Cropster::Response::Variety objects
    def varieties(opts={})
      find_collection("varieties", opts)
    end

    # Process the response from Cropster into appriate objects
    # @param response [Typhoeus::Response]
    def process(response)
      Cropster::Response::ResponseHandler.
        new("Variety", data_set(response)).compiled_data
    end
  end
end
