module Cropster
  class Client
    attr_reader :api_key, :api_secret, :group_code

    def initialize(opts = {})
      @test_mode       = opts[:test_mode] ||= false
      @api_path        = opts[:api_path] ||= Cropster::API_PATH
      @api_key         = opts[:api_key] ||= ENV['CROPSTER_API_KEY']
      @api_secret      = opts[:api_secret] ||= ENV['CROPSTER_API_SECRET']
      @group_code      = opts[:group_code] ||= ENV['CROPSTER_GROUP_CODE']
    end

    def roast_batches(opts={})
      response = request(base_url(opts.merge({processingStep: 'coffee.roasting'})))
      raise ServiceUnavailableError unless response.code == 200
      Cropster::Response::ResponseHandler.new.roast_batches(JSON.parse(response.body))
    end

    def base_url
      "#{host}#{@api_path}"
    end

    def request(url)
      Typhoeus::Request.get(url, userpwd: authentication)
    end

    def data_set(response)
      JSON.parse(response.body)["data"]
    rescue
      {}
    end

    def uri_options(filter_type, opts)
      URI.encode(opts.map{|k,v| "filter[#{filter_type}][#{k}]=#{v}"}.join("&"))
    end

    protected
    def authentication
      "#{@api_key}:#{@api_secret}"
    end

    def host
      @test_mode ?  Cropster::SERVER_TEST : Cropster::SERVER_PRODUCTION
    end

  end
end
