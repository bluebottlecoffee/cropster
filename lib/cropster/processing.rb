##
# Provides an interface to the Cropster Processing system
#
# https://cropstercore.docs.apiary.io/#reference/production-&-lots/processing
#
module Cropster
  class Processing < Cropster::Base
    # Find a single processing
    # @param id [String] the id of the required Processing
    # @return [Cropster::Response::Processing]
    def processing(id)
      find_by_id("processings", id).first
    end

    # Find a collection of Processing Objects
    # @param opts [Hash] options to filter the request
    # @return [Array] of Cropster::Response::Processing objects
    def processings(opts={})
      find_collection("processings", opts)
    end

    # Process the response from Cropster into appriate objects
    # @param response [Typhoeus::Response]
    def process(response)
      Cropster::Response::ResponseHandler.
        new("Processing", data_set(response)).compiled_data
    end
  end
end
