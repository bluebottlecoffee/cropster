module Cropster
  class Contact < Cropster::Base
    def contact(id)
      response = get_response("/contacts/#{id}")
      raise ServiceUnavailableError unless response.code == 200
      process(response).first
    end

    def contacts(opts={})
      response = get_response("/contacts" + url_filter(opts))
      raise ServiceUnavailableError unless response.code == 200
      process(response)
    end

    def url_filter(opts={})
      "?#{uri_options("contacts", opts)}"
    end

    def process(response)
      Cropster::Response::ResponseHandler.
        new("Contact", data_set(response)).compiled_data
    end
  end
end
