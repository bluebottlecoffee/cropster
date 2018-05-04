##
# Converts a Hash into a Cropster::Response::Permission object
#
module Cropster::Response
  class Permission < Cropster::Response::FormattedResponseItem
    attr_accessor :name

    def load_attributes(attributes)
      return if attributes.nil?
      @name = attributes[:name]
    end
  end
end
