require 'typhoeus'
require 'json'

require "cropster/base"
require "cropster/hash"
require "cropster/version"
require "cropster/client"
require 'cropster/constants'
require 'cropster/lot'
require 'cropster/location'
require 'cropster/processing'

require 'cropster/response/response_handler'
require 'cropster/response/formatted_response_item'
require 'cropster/response/location'
require 'cropster/response/weight'
require 'cropster/response/price'
require 'cropster/response/project'
require 'cropster/response/source'
require 'cropster/response/lot'
require 'cropster/response/processing'

ServiceUnavailableError = Class.new(StandardError)
