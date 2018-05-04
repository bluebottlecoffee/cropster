require 'typhoeus'
require 'json'

require 'cropster/constants'
require "cropster/base"
require "cropster/hash"
require "cropster/string"
require "cropster/version"
require "cropster/client"

require "cropster/contact"
require "cropster/certificate"
require 'cropster/group'
require 'cropster/group_membership'
require 'cropster/lot'
require 'cropster/location'
require 'cropster/machine'
require 'cropster/permission'
require 'cropster/processing'
require 'cropster/processing_comment'
require 'cropster/processing_curve'
require 'cropster/processing_measure'
require 'cropster/profile'
require 'cropster/profile_component'
require 'cropster/profile_lot_reference'
require 'cropster/project'
require 'cropster/property'
require 'cropster/roasting_action'
require 'cropster/source_contact'
require 'cropster/user'
require 'cropster/variety'

require 'cropster/response/response_handler'
require 'cropster/response/formatted_response_item'
require 'cropster/response/price'
require 'cropster/response/source'
require 'cropster/response/weight'

require 'cropster/response/contact'
require 'cropster/response/certificate'
require 'cropster/response/group'
require 'cropster/response/group_membership'
require 'cropster/response/lot'
require 'cropster/response/location'
require 'cropster/response/machine'
require 'cropster/response/permission'
require 'cropster/response/processing'
require 'cropster/response/processing_comment'
require 'cropster/response/processing_curve'
require 'cropster/response/processing_measure'
require 'cropster/response/profile'
require 'cropster/response/profile_component'
require 'cropster/response/profile_lot_reference'
require 'cropster/response/project'
require 'cropster/response/property'
require 'cropster/response/relationship'
require 'cropster/response/roasting_action'
require 'cropster/response/source_contact'
require 'cropster/response/user'
require 'cropster/response/variety'

ServiceUnavailableError = Class.new(StandardError)
