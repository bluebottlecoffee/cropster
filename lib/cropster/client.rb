module Cropster
  class Client
    attr_reader :api_key, :api_secret, :group_code

    def initialize(opts = {})
      @test_mode       = opts[:test_mode] == true
      @api_path        = opts[:api_path] ||= Cropster::API_PATH
      @api_key         = opts[:api_key]
      @api_secret      = opts[:api_secret]
      @group_code      = opts[:group_code]
    end

    def green_lots(opts={})
      response = request(base_url(opts))
      raise ServiceUnavailableError unless response.code == 200
      Cropster::Response::ResponseHandler.new.green_lots(data_set(response))
    end

    def roast_batches(opts={})
      response = request(base_url(opts.merge({processingStep: 'coffee.roasting'})))
      raise ServiceUnavailableError unless response.code == 200
      Cropster::Response::ResponseHandler.new.roast_batches(JSON.parse(response.body))
    end

    def uri_options(opts)
      URI.encode(opts.map{|k,v| "#{k}=#{v}"}.join("&"))
    end

    protected
    def request(url)
      Typhoeus::Request.get(url, userpwd: authentication)
    end

    def authentication
      "#{@api_key}:#{@api_secret}"
    end

    def host
      @test_mode ?  Cropster::SERVER_TEST : Cropster::SERVER_PRODUCTION
    end

    def data_set(response)
      JSON.parse(response.body)["data"]
    end

    def base_url(opts)
      "#{host}#{@api_path}/lots?filter%5Blots%5D%5Bgroup%5D=#{@group_code}&#{uri_options(opts)}"
    end

  end
end
