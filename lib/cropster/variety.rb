module Cropster
  class Variety < Cropster::Base
    def variety(id)
      find_by_id("varieties", id).first
    end

    def varieties(opts={})
      find_collection("varieties", opts)
    end

    def process(response)
      Cropster::Response::ResponseHandler.
        new("Variety", data_set(response)).compiled_data
    end
  end
end
