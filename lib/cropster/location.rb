module Cropster
  class Location < Cropster::Base
    def location(id)
      find_by_id("locations", id).first
    end

    def locations(opts={})
      find_collection("locations", opts)
    end

    def process(response)
      Cropster::Response::ResponseHandler.
        new("Location", data_set(response)).compiled_data
    end
  end
end
