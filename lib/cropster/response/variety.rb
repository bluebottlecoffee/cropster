##
# Converts a Hash into a Cropster::Response::Variety object
#
module Cropster::Response
  class Variety < Cropster::Response::FormattedResponseItem
    attr_accessor :name, :product_type

    # @param attributes [Hash]
    def load_attributes(attributes)
      @name = attributes[:name]
      @product_type = attributes[:productType]
    end
  end
end
