module Cropster
  class Processing < Cropster::Base
    def processing(id)

    end

    def processings(opts={})
      response = @client.request(base_url + '/processings' + url_filter(opts))
      raise ServiceUnavailableError unless response.code == 200
      process(response)
    end

    def url_filter(opts={})
      "][profile?filter[processings][group]=#{@client.group_code}&#{@client.uri_options("processings", opts)}"
    end

    def process(response)
      Cropster::Response::ResponseHandler.new.processings(@client.data_set(response))
    end
  end
end
