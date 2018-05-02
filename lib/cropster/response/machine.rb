##
# Converts a Hash object into a Cropster::Response::Machine
#
module Cropster::Response
  class Machine < Cropster::Response::FormattedResponseItem
    attr_accessor :name, :machine_type, :capacity

    def load_attributes(attributes)
      return if attributes.nil?
      @name = attributes[:name]
      @machine_type = attributes[:type]
      @capacity = load_weight(attributes[:capacity])
    end
  end
end
