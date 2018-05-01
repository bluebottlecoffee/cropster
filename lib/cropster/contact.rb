module Cropster
  class Contact < Cropster::Base
    def contact(id)
      find_by_id("contacts", id).first
    end

    def contacts(opts={})
      find_collection("contacts", opts)
    end

    def process(response)
      Cropster::Response::ResponseHandler.
        new("Contact", data_set(response)).compiled_data
    end
  end
end
