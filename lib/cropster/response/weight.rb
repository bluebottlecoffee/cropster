require 'bigdecimal'

module Cropster
  module Response
    class Weight
      DEFAULT_CONVERSIONS = {
        'QUINTAL' => 46000,
        'LBS'     => 453.52937,
        'KG'      => 1000
      }

      def initialize(data)
        @data = data || {}
      end

      def amount
        BigDecimal.new(@data.fetch('amount', 0), 16)
      end

      def unit
        @data.fetch('unit', '')
      end

      def grams
        conversion_factor = DEFAULT_CONVERSIONS.fetch(unit_of_measure) do
          raise "unknown unit conversion #{unit_of_measure}"
        end

        total_amount * conversion_factor
      end

      def pounds
        grams / DEFAULT_CONVERSIONS.fetch('LBS')
      end

      def total_amount
        if unit_value.zero?
          amount
        else
          amount * unit_value
        end
      end

      def unit_of_measure
        if unit.include?('LBS')
          'LBS'
        elsif unit.include?('KG')
          'KG'
        elsif unit.include?('QUINTAL')
          'QUINTAL'
        else
          raise "unknown units in #{unit}"
        end
      end

      def unit_type
        if unit_of_measure == 'LBS'
          ''
        else
          @unit.gsub(/[?0-9]/, ' ').split(' ')[0]
        end
      end

      def package_weight_grams
        if amount > 0
          grams / amount
        else
          0
        end
      end

      private

      def unit_value
        unit.gsub(/[^0-9]/, '').to_i
      end
    end
  end
end
