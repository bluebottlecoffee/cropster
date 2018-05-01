module Cropster
  class Base
    attr_reader :client

    def initialize(client=nil)
      @client= client.nil? ? Cropster::Client.new() : client
    end

    def get_response(url)
      @client.request(url)
    end

    def group_code
      @client.group_code
    end

    def data_set(response)
      @client.data_set(response)
    end

    def uri_options(filter, opts)
      @client.uri_options(filter, opts)
    end

    protected
    def base_url
      "#{@client.base_url}"
    end
  end
end
