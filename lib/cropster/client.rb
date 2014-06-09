require 'typhoeus'

module Cropster
  class Client
    ENDPOINT = 'https://c-sar.cropster.com/api/rest/v1'

    attr_reader :client_username, :client_password, :group_code

    def initialize opts = {}
      @client_username = opts[:client_username]
      @client_password = opts[:client_password]
      @group_code      = opts[:group_code]
    end

    def base_url(opts)
      "#{ENDPOINT}/lot?groupCode=#{@group_code}&#{uri_options(opts)}"
    end

    def username_password
      "#{@client_username}:#{@client_password}"
    end

    def green_lots(opts={})
      response = request(base_url(opts.merge({processingStep: 'coffee.green'})))
      raise "There was a problem, code: #{response.code}" unless response.code == 200
      JSON.parse(response.body)
    end

    def roasts(opts={})
      response = request(base_url(opts.merge({processingStep: 'coffee.roasting'})))
      raise "There was a problem, code: #{response.code}" unless response.code == 200
      JSON.parse(response.body)
    end

    def uri_options(opts)
      URI.encode(opts.map{|k,v| "#{k}=#{v}"}.join("&"))
    end

    def request(url)
      Typhoeus::Request.get(url, userpwd: username_password)
    end
  end
end