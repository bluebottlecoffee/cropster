##
# Converts a Hash into a Cropster::Response::Certificate
#
module Cropster::Response
  class Certificate < Cropster::Response::FormattedResponseItem
    attr_accessor :name

    # @param attributes [Hash]
    def load_attributes(attributes)
      @name = attributes[:name]
    end
  end
end
