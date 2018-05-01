module Cropster
  class Variety < Cropster::Base
    def variety(id)
      response = get_response("/varieties/#{id}")
      handle_error(response)
      process(response).first
    end

    def varieties(opts={})
      response = get_response("/varieties" + url_filter(opts))
      handle_error(response)
      process(response)
    end

    def url_filter(opts={})
      "?#{uri_options("varieties", opts)}"
    end

    def process(response)
      Cropster::Response::ResponseHandler.
        new("Variety", data_set(response)).compiled_data
    end
  end
end
