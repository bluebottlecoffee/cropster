module Cropster
  class Base
    attr_reader :client

    def initialize(client=nil)
      @client= client.nil? ? Cropster::Client.new() : client
    end

    def find_by_id(object_url, id)
      response = get_response("/#{object_url}/#{id}")
      handle_error(response)
      process(response)
    end

    def find_collection(object_url, opts)
      response = get_response("/#{object_url}" + url_filter(object_url, opts))
      handle_error(response)
      process(response)
    end

    def url_filter(filter, opts = {})
      "?#{uri_options(filter, opts)}"
    end

    def process(response); end

    private
    def group_code
      @client.group_code
    end

    def data_set(response)
      @client.data_set(response)
    end

    def uri_options(filter, opts)
      @client.uri_options(filter, opts)
    end

    def handle_error(response)
      raise ServiceUnavailableError unless response.code == 200
    end

    def get_response(url)
      @client.request(url)
    end

    def base_url
      "#{@client.base_url}"
    end
  end
end
