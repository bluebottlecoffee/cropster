module Cropster
  class Base
    attr_reader :client

    def initialize(client=nil)
      @client= client.nil? ? Cropster::Client.new() : client
    end

    protected
    def base_url
      "#{@client.base_url}"
    end
  end
end
