module Cropster
  class Lot < Cropster::Base
    def lot(id)
      response = get_response("/lot/#{id}")
      raise ServiceUnavailableError unless response.code == 200
      process(response).first
    end

    def lots(opts={})
      response = get_response("/lots" + url_filter(opts))
      raise ServiceUnavailableError unless response.code == 200
      process(response)
    end

    def url_filter(opts={})
      "?filter[lots][group]=#{group_code}&#{@client.uri_options("lots", opts)}"
    end

    def process(response)
      Cropster::Response::ResponseHandler.new.lots(data_set(response))
    end
  end
end
