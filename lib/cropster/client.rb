require 'typhoeus'
require 'cropster/response/response_handler'

module Cropster
  class Client
    attr_reader :client_api_key, :client_api_secret, :group_code
    ServiceUnavailableError = Class.new(StandardError)

    def initialize opts = {}
      @test_mode         = opts[:test_mode].present?
      @api_path          = opts[:api_path].presence || '/api/rest/v1'
      @client_api_key    = opts[:client_api_key]
      @client_api_secret = opts[:client_api_secret]
      @group_code        = opts[:group_code]
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
      Typhoeus::Request.get(url, userpwd: basic_auth)
    end

    def roast_batches(opts={})
      response = request(base_url(opts.merge({processingStep: 'coffee.roasting'})))
      raise ServiceUnavailableError unless response.code == 200
      Cropster::Response::ResponseHandler.new.roast_batches(JSON.parse(response.body))
    end

    def uri_options(opts)
      URI.encode(opts.map{|k,v| "#{k}=#{v}"}.join("&"))
    end

    def basic_auth
      "#{@client_api_key}:#{@client_api_secret}"
    end
  end
end
