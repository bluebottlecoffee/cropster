require 'json'
require 'typhoeus'
require 'cropster/response/response_handler'

module Cropster
  class Client
    attr_reader :client_username, :client_password, :group_code
    ServiceUnavailableError = Class.new(StandardError)

    def initialize opts = {}
      @test_mode       = !opts[:test_mode].nil?
      @api_path        = opts.fetch(:api_path, '/api/rest/v1')
      @client_username = opts[:client_username]
      @client_password = opts[:client_password]
      @group_code      = opts[:group_code]
    end

    def base_url(opts)
      "#{host}#{@api_path}/lot?groupCode=#{@group_code}&#{uri_options(opts)}"
    end

    def green_lots(opts={})
      response = request(base_url(opts.merge({processingStep: 'coffee.green'})))
      raise ServiceUnavailableError unless response.code == 200
      Cropster::Response::ResponseHandler.new.green_lots(JSON.parse(response.body))
    end

    def host
      @test_mode ? 'https://test.cropster.com' : 'https://c-sar.cropster.com'
    end

    def request(url)
      Typhoeus::Request.get(url, userpwd: username_password)
    end

    def roast_batches(opts={})
      response = request(base_url(opts.merge({processingStep: 'coffee.roasting'})))
      raise ServiceUnavailableError unless response.code == 200
      Cropster::Response::ResponseHandler.new.roast_batches(JSON.parse(response.body))
    end

    def uri_options(opts)
      URI.encode(opts.map{|k,v| "#{k}=#{v}"}.join("&"))
    end

    def username_password
      "#{@client_username}:#{@client_password}"
    end
  end
end
