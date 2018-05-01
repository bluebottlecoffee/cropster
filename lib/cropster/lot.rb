module Cropster
  class Lot < Cropster::Base
    def lot(id)
      response = get_response("/lots/#{id}")
      handle_error(response)
      process(response).first
    end

    def lots(opts={})
      response = get_response("/lots" + url_filter(opts))
      handle_error(response)
      process(response)
    end

    def url_filter(opts={})
      "?#{uri_options("lots", opts)}"
    end

    def process(response)
      Cropster::Response::ResponseHandler.
        new("Lot", data_set(response)).compiled_data
    end
  end
end
