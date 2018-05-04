##
# Provides an interface to the Cropster API Processing Measure system
#
# https://cropstercore.docs.apiary.io/#reference/production-&-lots/processing-measures/
#
module Cropster
  class ProcessingMeasure < Cropster::Base
    # Find a single ProcessingMeasure
    #
    # @param id [String] the id of the required ProcessingMeasure
    # @return [Cropster::Response::ProcessingMeasure]
    def processing_measure(id)
      find_by_id("processing_measures", id).first
    end

    # Find a collection of ProcessingMeasure objects
    #
    # @param opts [Hash] options to filter the request
    # @return [Array] of Cropster::Response::ProcessingMeasure objects
    def processing_measures(opts={})
      find_collection("processing_measures", opts)
    end

    # Process the response from Cropster into appriate objects
    #
    # @param response [Typhoeus::Response]
    def process(response)
      Cropster::Response::ResponseHandler.
        new("ProcessingMeasure", data_set(response)).compiled_data
    end


  end
end
