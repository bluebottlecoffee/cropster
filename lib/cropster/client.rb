require 'typhoeus'
require 'json'

module Cropster
  class Client
    attr_reader :client_username, :client_password, :group_code
    ServiceUnavailableError = Class.new(StandardError)

    def initialize(opts = {})
      @test_mode       = opts[:test_mode] == true
      @api_path        = opts[:api_path] ||= '/api/v2'
      @api_key         = opts[:api_key]
      @client_password = opts[:api_secret]
      @group_code      = opts[:group_code]
    end

    def base_url(opts)
      "#{host}#{@api_path}/lots?filter%5Blots%5D%5Bgroup%5D=#{@group_code}&#{uri_options(opts)}"
    end

    def green_lots(opts={})
      response = request(base_url(opts))
      raise ServiceUnavailableError unless response.code == 200
      Cropster::Response::ResponseHandler.new.green_lots(JSON.parse(response.body))
    end

    def host
      @test_mode ? 'https://private-anon-e2e6946d27-cropstercore.apiary-mock.com' : 'https://c-sar.cropster.com'
    end

    def request(url)
      Typhoeus::Request.get(url, userpwd: authentication)
    end

    def roast_batches(opts={})
      response = request(base_url(opts.merge({processingStep: 'coffee.roasting'})))
      raise ServiceUnavailableError unless response.code == 200
      Cropster::Response::ResponseHandler.new.roast_batches(JSON.parse(response.body))
    end

    def uri_options(opts)
      URI.encode(opts.map{|k,v| "#{k}=#{v}"}.join("&"))
    end

    def authentication
      "#{@api_key}:#{@api_secret}"
    end
  end
end
