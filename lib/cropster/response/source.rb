module Cropster
  module Response
    class Source
      def initialize(data)
        @data = data || {}
      end

      def date
        Time.at(data['date'].to_i / 1000).utc if data.has_key?('date')
      end

      def lot
        GreenLot.new(data['lot'])
      end

      def weight
        Weight.new(data['weight'])
      end
    end
  end
end
