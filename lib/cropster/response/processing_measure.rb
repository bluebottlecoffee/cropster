##
# Converts a Hash into a Cropster::Response::ProcessingMeasure
#
module Cropster::Response
  class ProcessingMeasure < Cropster::Response::FormattedResponseItem
    attr_accessor :name, :amount, :unit

    def load_attributes(attributes)
      return if attributes.nil?
      @name = attributes[:name]
      @amount = attributes[:measure][:amount]
      @unit = attributes[:measure][:unit]
    end
  end
end
