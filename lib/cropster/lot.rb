module Cropster
  class Lot < Cropster::Base
    def lot(id)
      response = get_response("/lots/#{id}")
      raise ServiceUnavailableError unless response.code == 200
      process(response).first
    end

    def lots(opts={})
      response = get_response("/lots" + url_filter(opts))
      raise ServiceUnavailableError unless response.code == 200
      process(response)
    end

    def url_filter(opts={})
      "?#{uri_options("lots", opts.merge({group: group_code}))}"
    end

    def process(response)
      Cropster::Response::ResponseHandler.
        new("Lot", data_set(response)).compiled_data
    end
  end
end
