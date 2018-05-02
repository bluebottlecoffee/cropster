##
# Provide an interace to the Cropster API Machine system
#
# https://cropstercore.docs.apiary.io/#reference/production-&-lots/machines
#
module Cropster
  class Machine < Cropster::Base
    # Find a single Machine
    # @param id [String] the id of the requird Machine
    # @return [Cropster::Response::Machine]
    def machine(id)
      find_by_id("machines", id).first
    end

    # Find a collection of Machine objects
    # @param opts [Hash] options to filter the request
    # @return [Array] of Cropster::Response::Machine objects
    def machines(opts={})
      find_collection("machines", opts)
    end

    # Process the response from Cropster into appriate objects
    # @param response [Typhoeus::Response]
    def process(response)
      Cropster::Response::ResponseHandler.
        new("Machine", data_set(response)).compiled_data
    end
  end
end
