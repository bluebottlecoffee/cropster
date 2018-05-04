##
# Provides an interface to the Cropster API Processing Comment system
#
# https://cropstercore.docs.apiary.io/#reference/production-&-lots/processing-comments
#
module Cropster
  class ProcessingComment < Cropster::Base
    # Find a single ProcessingComment
    #
    # @param id [String] the id of the required ProcessingComment
    # @return [Cropster::Response::ProcessingComment]
    def processing_comment(id)
      find_by_id("processing_comments", id).first
    end

    # Find a collection of ProcessingComment objects
    #
    # @param opts [Hash] options to filter the request
    # @return [Array] of Cropster::Response::ProcessingComment objects
    def processing_comments(opts={})
      find_collection("processing_comments", opts)
    end

    # Process the response from Cropster into appriate objects
    #
    # @param response [Typhoeus::Response]
    def process(response)
      Cropster::Response::ResponseHandler.
        new("ProcessingComment", data_set(response)).compiled_data
    end

  end
end
