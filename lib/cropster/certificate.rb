##
# Provides and interface to the Cropster API Certificate system
#
# https://cropstercore.docs.apiary.io/#reference/production-&-lots/certificates

module Cropster
  class Certificate < Cropster::Base

    # Find a single Certificate
    #
    # @param id [String] the id of the required Certificate
    # @return [Cropster::Response::Certificate]
    def certificate(id)
      find_by_id("certificates", id).first
    end

    # POSTs a new Certificate
    #
    # @param data [Hash] the new Certificate
    # @return [Cropster::Response::Certificate]
    def create_certificate(data)
      create("certificates", data).first
    end

    # Updates an existing Certificate
    #
    # @param id [String] the ID of the Certificate to update
    # @param data [Hash] the fields to be updates
    # @return [Cropster::Response::Certificate]
    def update_certificate(id, data)
      update("certificates", id, data).first
    end

    # Process the response from Cropster into appropriate objects
    # @param response [Typhoeus::Response]
    def process(response)
      Cropster::Response::ResponseHandler.
        new("Certificate", data_set(response)).compiled_data
    end
  end
end
