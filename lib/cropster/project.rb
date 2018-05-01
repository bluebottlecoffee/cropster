module Cropster
  class Project < Cropster::Base
    def project(id)
      find_by_id("projects", id).first
    end

    def projects(opts={})
      find_collection("projects", opts)
    end

    def process(response)
      Cropster::Response::ResponseHandler.
        new("Project", data_set(response)).compiled_data
    end
  end
end
