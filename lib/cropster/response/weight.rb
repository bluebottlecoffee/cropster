##
# Converts a hash containing Weight information from Cropster into a Weight
# object, and performs unit conversions where necessary.
#
module Cropster::Response
  class Weight
    attr_accessor :amount, :unit

    def initialize(data)
      load_from_data(data)
    end

    def load_from_data(data)
      @amount = data[:amount] ||= 0
      @unit   = data[:unit] ||= ""
    end

    def grams
      if unit_of_measure == 'QUINTAL'
        total_amount.to_f * 46000
      elsif unit_of_measure == 'LBS'
        total_amount.to_f * 453.59237
      elsif unit_of_measure == 'KG'
        total_amount.to_f * 1000
      else 
        raise "unknown unit conversion #{unit_of_measure}"
      end
    end

    def pounds
      grams / 453.59237
    end

    def total_amount
      unit_value == 0 ? amount : (amount.to_f * unit_value.to_f)
    end

    def unit_of_measure
      if @unit.include?('LBS')
        'LBS'
      elsif @unit.include?('KG')
        'KG'
      elsif @unit.include?('QUINTAL')
        'QUINTAL'
      else
        raise "unknown units in #{@unit}"
      end
    end

    def unit_value
      @unit.gsub(/[^0-9]/, '').to_i 
    end

    def unit_type
      if unit_of_measure == 'LBS'
        ''
      else
        @unit.gsub(/[?0-9]/, ' ').split(' ')[0]
      end
    end

    def package_weight_grams
      amount > 0 ? (grams / amount.to_f) : 0
    end

  end

end
