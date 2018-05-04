##
# Provides basic functionality for child classes to interact with the Cropster
# API.
#
module Cropster
  class Base
    attr_reader :client

    # @param client [Cropster::Client] An instance of the Cropster::Client
    # with appropriate authorization data
    def initialize(client=nil)
      @client= client.nil? ? Cropster::Client.new() : client
    end

    # Finds a single object on the Cropster API
    #
    # @param object_url [String] the REST url for the object (eg "lots")
    # @param id [String] The ID for the requested object
    # @return `Cropster::Response::FormattedResponseItem` subclassed object
    def find_by_id(object_url, id)
      response = get("/#{object_url}/#{id}")
      handle_error(response)
      process(response)
    end

    # Finds multiple objects on the Cropster API
    #
    # @param object_url [String] The REST url for the object
    # @param ids [String] A comma separated string of ID's (eg "AA,BB")
    #
    # @return [Array] an array of the
    # Cropster::Response::FormattedResponseItem subclass objects 
    def find_by_ids(object_url, ids)
      response = get("/#{object_url}/#{ids}")
      handle_error(response)
      process(response)
    end

    # Finds a collection of API objects
    #
    # @param object_url [String] the REST url for the object (eg "lots")
    # @param opts [Hash] options to be added to URL to filter the requests
    # @return [Array] An array of the
    # `Cropster::Response::FormattedResponseItem` subclass objects
    def find_collection(object_url, opts)
      response = get("/#{object_url}" + url_filter(object_url, opts))
      handle_error(response)
      process(response)
    end

    # POSTs data to the API via Cropster::Client
    #
    # @param object_url [String] the REST url for the object (eg "lots")
    # @param data [Hash] the data to be POSTed
    # @return [Object] the Cropster::Response::FormattedResponseItem subclass
    def create(object_url, data)
      response = post("/#{object_url}/", data)
      handle_error(response)
      process(response)
    end

    # PATCHes data to the API via the Cropster::Client
    #
    # @param object_url [String] the REST url for the object (eg "lots")
    # @param id [String] the ID of the object to be updated
    # @param data [Hash] contains the updated data for the object
    # @return [Object] the Cropster::Response::FormattedResponseItem subclass
    def update(object_url, id, data)
      response = patch("/#{object_url}/#{id}", data)
      handle_error(response)
      process(response)
    end

    # A method to be overridden to process the data returned via the API
    def process(response); end

    protected
    # Builds the filter URL from the provided options
    #
    # @param filter [String] the object name to filter
    # @param opts [Hash] options to filter the request
    # @return [String]
    def url_filter(filter, opts = {})
      "?#{uri_options(filter, opts)}"
    end

    private
    def group_code
      @client.group_code
    end

    def data_set(response)
      @client.data_set(response)
    end

    def uri_options(filter, opts)
      @client.uri_options(filter, opts)
    end

    # Raises an error if the API returns an error code
    def handle_error(response)
      raise ServiceUnavailableError unless response.code == 200
    end

    # Perform the actual interaction with the Cropster API
    def get(url)
      @client.get(url)
    end

    def post(url, data)
      @client.post(url, data)
    end

    def patch(url, data)
      @client.patch(url, data)
    end

    def base_url
      "#{@client.base_url}"
    end
  end
end
