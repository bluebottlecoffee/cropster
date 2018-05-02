##
# Provide an interface to the Cropster API Project system
#
# https://cropstercore.docs.apiary.io/#reference/production-&-lots/projects
#
module Cropster
  class Project < Cropster::Base
    # Find a single Project
    # @param id [String] the id of the requird Project
    # @return [Cropster::Response::Project]
    def project(id)
      find_by_id("projects", id).first
    end

    # Find a collection of Project objects
    # @param opts [Hash] options to filter the request
    # @return [Array] of Cropster::Response::Project objects
    def projects(opts={})
      find_collection("projects", opts)
    end

    # Process the response from Cropster into appriate objects
    # @param response [Typhoeus::Response]
    def process(response)
      Cropster::Response::ResponseHandler.
        new("Project", data_set(response)).compiled_data
    end
  end
end
