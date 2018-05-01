module Cropster
  class Project < Cropster::Base
    def project(id)
      response = get_response("/projects/#{id}")
      handle_error(response)
      process(response).first
    end

    def projects(opts={})
      response = get_response("/projects" + url_filter(opts))
      handle_error(response)
      process(response)
    end

    def url_filter(opts={})
      "?#{uri_options("projects", opts)}"
    end

    def process(response)
      Cropster::Response::ResponseHandler.
        new("Project", data_set(response)).compiled_data
    end
  end
end
