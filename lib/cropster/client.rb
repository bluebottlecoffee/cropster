require "json"
require "typhoeus"
require "cgi"

module Cropster
  class Client
    attr_reader :client_username, :client_password, :group_code
    ServiceUnavailableError = Class.new(StandardError)

    def initialize(opts = {})
      @test_mode       = !opts[:test_mode].nil?
      @api_path        = opts.fetch(:api_path, '/api/rest/v1')
      @client_username = opts.fetch(:client_username, ENV['CROPSTER_USERNAME'])
      @client_password = opts.fetch(:client_password, ENV['CROPSTER_PASSWORD'])
      @group_code      = opts.fetch(:group_code, ENV['CROPSTER_GROUP_CODE'])
    end

    def green_lots(opts={})
      response = request(base_url(opts.merge({processingStep: 'coffee.green'})))
      vet_response(response)
      JSON.parse(response.body).map { |gl| Response::GreenLot.new(gl) }
    end

    def roast_batches(opts={})
      response = request(base_url(opts.merge({processingStep: 'coffee.roasting'})))
      vet_response(response)
      JSON.parse(response.body).map { |gl| Response::RoastBatch.new(gl) }
    end

    private

    def request(url)
      Typhoeus::Request.get(url, userpwd: username_password)
    end

    def base_url(opts)
      "#{host}#{@api_path}/lot?groupCode=#{@group_code}&#{uri_options(opts)}"
    end

    def host
      @test_mode ? 'https://test.cropster.com' : 'https://c-sar.cropster.com'
    end

    def uri_options(opts)
      CGI.escape(opts.map{|k,v| "#{k}=#{v}"}.join("&"))
    end

    def username_password
      "#{@client_username}:#{@client_password}"
    end

    def vet_response(response)
      raise ServiceUnavailableError, response.code unless response.code == 200
    end
  end
end
