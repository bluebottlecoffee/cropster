##
# Converts a Hash into a Cropster::Response::Property object
#
module Cropster::Response
  class Property < Cropster::Response::FormattedResponseItem
    attr_accessor :name, :value

    def load_attributes(attributes)
      return if attributes.nil?
      @name = attributes[:name]
      @value = attributes[:value]
    end

  end
end
