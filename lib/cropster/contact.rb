module Cropster
  class Contact < Cropster::Base
    def contact(id)
      response = get_response("/contacts/#{id}")
      handle_error(response)
      process(response).first
    end

    def contacts(opts={})
      response = get_response("/contacts" + url_filter(opts))
      handle_error(response)
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
