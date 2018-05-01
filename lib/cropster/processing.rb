module Cropster
  class Processing < Cropster::Base
    def processing(id)
      response = get_response("/processings/#{id}")
      raise ServiceUnavailableError unless response.code == 200
      process(response).first
    end

    def processings(opts={})
      response = get_response("/processings#{url_filter(opts)}")
      raise ServiceUnavailableError unless response.code == 200
      process(response)
    end

    def url_filter(opts={})
      "][profile?#{uri_options("processings", opts.merge({group: group_code}))}"
    end

    def process(response)
      Cropster::Response::ResponseHandler.
        new("Processing", data_set(response)).compiled_data
    end
  end
end
