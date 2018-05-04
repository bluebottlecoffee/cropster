##
# Provides an interface to the Cropster API Variety system
#
# https://cropstercore.docs.apiary.io/#reference/production-&-varieties/varieties
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

    # POSTs a new Variety to the API
    #
    # @param data [Hash] the new Variety
    # @return [Cropster::Response::Variety]
    def create_variety(data)
      create("varieties", data).first
    end

    # Updates an existing variety, currently only supports updating 
    # @name and @accepted attributes.
    #
    # @param id [String] the ID of the Variety to be updated
    # @param data [Hash] containing the fields to be updated
    # @return [Cropster::Response::Variety]
    def update_variety(id, data)
      update("varieties", id, data).first
    end


    # Process the response from Cropster into appriate objects
    # @param response [Typhoeus::Response]
    def process(response)
      Cropster::Response::ResponseHandler.
        new("Variety", data_set(response)).compiled_data
    end
  end
end
