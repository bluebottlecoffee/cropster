module Cropster
  class Location < Cropster::Base
    def location(id)
      response = get_response("/locations/#{id}")
      handle_error(response)
      process(response).first
    end

    def locations(opts={})
      response = get_response("/locations" + url_filter(opts))
      handle_error(response)
      process(response)
    end

    def url_filter(opts={})
      "?#{uri_options("locations", opts)}"
    end

    def process(response)
      Cropster::Response::ResponseHandler.
        new("Location", data_set(response)).compiled_data
    end
  end
end
