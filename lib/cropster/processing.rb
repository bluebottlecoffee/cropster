module Cropster
  class Processing < Cropster::Base
    def processing(id)
      find_by_id("processings", id).first
    end

    def processings(opts={})
      find_collection("processings", opts)
    end

    def url_filter(filter, opts={})
      "][profile?#{uri_options(filter, opts)}"
    end

    def process(response)
      Cropster::Response::ResponseHandler.
        new("Processing", data_set(response)).compiled_data
    end
  end
end
