module Cropster
  class Location < Cropster::Base
    def location(id)
      response = get_response("/locations/#{id}")
      raise ServiceUnavailableError unless response.code == 200
      process(response).first
    end

    def locations(opts={})
      response = get_response("/locations" + url_filter(opts))
      raise ServiceUnavailableError unless response.code == 200
      process(response)
    end

    def url_filter(opts={})
      "?filter[locations][group]=#{group_code}&#{@client.uri_options("locations", opts)}"
    end

    def process(response)
      Cropster::Response::ResponseHandler.new.locations(@client.data_set(response))
    end
  end
end
