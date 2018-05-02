##
# Converts a hash containing Price information from Cropster into a Price
# Object
#

module Cropster::Response
  class Price
    attr_accessor :amount, :currency, :base_amount, :base_unit

    def initialize(data, base_data)
      return if data.nil?
      load_from_data(data, base_data)
    end

    def load_from_data(data, base_data)
      @amount = data[:amount]
      @currency = data[:currency]
      return if base_data.nil?
      @base_amount = base_data[:amount]
      @base_unit = base_data[:unit]
    end
  end
end
