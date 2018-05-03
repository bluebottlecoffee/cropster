##
# Converts a Hash into a Cropster::Response::Group object
#
module Cropster::Response
  class Group < Cropster::Response::FormattedResponseItem
    attr_accessor :name

    # @param attributes [Hash]
    def load_attributes(attributes)
      @name = attributes[:name]
    end
  end
end
