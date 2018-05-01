module Cropster
  class Lot < Cropster::Base
    def lot(id)
      find_by_id("lots", id).first
    end

    def lots(opts={})
      find_collection("lots", opts)
    end

    def process(response)
      Cropster::Response::ResponseHandler.
        new("Lot", data_set(response)).compiled_data
    end
  end
end
