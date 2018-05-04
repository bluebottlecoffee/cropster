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

    # POSTs a new Project to the API
    #
    # @param data [Hash] the new Project
    # @return [Cropster::Response::Project]
    def create_project(data)
      create("projects", data).first
    end

    # Updates an existing lot, currently only supports updating 
    # @name and @accepted attributes.
    #
    # @param id [String] the ID of the Project to be updated
    # @param data [Hash] containing the fields to be updated
    # @return [Cropster::Response::Project]
    def update_project(id, data)
      update("projects", id, data).first
    end
    # Process the response from Cropster into appriate objects
    # @param response [Typhoeus::Response]
    def process(response)
      Cropster::Response::ResponseHandler.
        new("Project", data_set(response)).compiled_data
    end
  end
end
