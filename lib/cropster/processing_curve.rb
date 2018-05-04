##
# Provides an interface to the Cropster API Processing Curve system
#
# https://cropstercore.docs.apiary.io/#reference/production-&-processing_curves/processing-curves
#
module Cropster
  class ProcessingCurve < Cropster::Base
    # Find a single ProcessingCurve
    #
    # @param id [String] the id of the required ProcessingCurve
    # @return [Cropster::Response::ProcessingCurve]
    def processing_curve(id)
      find_by_id("processing_curves", id).first
    end

    # Find a collection of ProcessingCurve objects
    #
    # @param opts [Hash] options to filter the request
    # @return [Array] of Cropster::Response::ProcessingCurve objects
    def processing_curves(opts={})
      find_collection("processing_curves", opts)
    end

    # Process the response from Cropster into appriate objects
    #
    # @param response [Typhoeus::Response]
    def process(response)
      Cropster::Response::ResponseHandler.
        new("ProcessingCurve", data_set(response)).compiled_data
    end

  end
end
