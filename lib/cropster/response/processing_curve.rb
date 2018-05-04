##
# Converts a Hash into a Cropster::Response::ProcessingCurve object
#
module Cropster::Response
  class ProcessingCurve < Cropster::Response::FormattedResponseItem
    attr_accessor :name, :duration, :unit, :values

    def initialize(data)
      @values = []
      super(data)
    end

    def load_attributes(attributes)
      return if attributes.nil?
      @name = attributes[:name]
      @duration = load_time(attributes[:duration])
      @unit = attributes[:unit]
      @values = load_values(attributes[:values])
    end

  end
end
