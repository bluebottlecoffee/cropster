require 'typhoeus'
require 'json'

require "cropster/base"
require "cropster/hash"
require "cropster/string"
require "cropster/version"
require "cropster/client"
require "cropster/contact"
require 'cropster/constants'
require 'cropster/lot'
require 'cropster/location'
require 'cropster/processing'
require 'cropster/project'
require 'cropster/variety'
require 'cropster/source_contact'

require 'cropster/response/response_handler'
require 'cropster/response/formatted_response_item'
require 'cropster/response/contact'
require 'cropster/response/location'
require 'cropster/response/weight'
require 'cropster/response/price'
require 'cropster/response/source'
require 'cropster/response/lot'
require 'cropster/response/processing'
require 'cropster/response/project'
require 'cropster/response/relationship'
require 'cropster/response/variety'
require 'cropster/response/source_contact'

ServiceUnavailableError = Class.new(StandardError)
