module Cropster
  class Location < Cropster::Base
    def location(id)
      response = get_response("/locations/#{id}")
      raise ServiceUnavailableError unless response.code == 200
      process(response).first
    end

    def locations(opts={})
      response = get_response("/locations" + url_filter(opts))
      raise ServiceUnavailableError unless response.code == 200
      process(response)
    end

    def url_filter(opts={})
      "?#{uri_options("locations", opts.merge({group: group_code}))}"
    end

    def process(response)
      Cropster::Response::ResponseHandler.
        new("Location", data_set(response)).compiled_data
    end
  end
end
