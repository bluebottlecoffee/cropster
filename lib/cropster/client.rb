require 'typhoeus'
require 'cropster/response/response_handler'

module Cropster
  class Client
    attr_reader :client_username, :client_password, :group_code
    ServiceUnavailableError = Class.new(StandardError)

    def initialize opts = {}
      @test_mode       = opts[:test_mode].present?
      @api_path        = opts[:api_path].presence || '/api/rest/v1'
      @client_username = opts[:client_username]
      @client_password = opts[:client_password]
      @group_code      = opts[:group_code]
    end

    def green_lots(opts={})
      options = opts.merge({processingStep: 'coffee.green'})
      Cropster::Response::ResponseHandler.new.green_lots( get('lot', options) )
    end

    def roast_batches(opts={})
      options = opts.merge({processingStep:'coffee.roasting'})
      Cropster::Response::ResponseHandler.new.roast_batches( get('lot', options) )
    end

    def get(path, opts={})
      url = "#{host}#{@api_path}/#{path}?#{uri_options( opts.merge('groupCode' => @group_code) )}"
      response = Typhoeus::Request.get(url, userpwd: username_password)
      raise ServiceUnavailableError unless response.code == 200
      JSON.parse(response.body)
    end

    private
    def host
      @test_mode ? 'https://test.cropster.com' : 'https://c-sar.cropster.com'
    end

    def uri_options(opts)
      URI.encode(opts.map{|k,v| "#{k}=#{v}"}.join("&"))
    end

    def username_password
      "#{@client_username}:#{@client_password}"
    end
  end
end
