module Cropster
  module Response
    class Source

      attr_accessor :date,
                    :lot,
                    :weight

      def initialize(data)
        load_from_data(data || {})
      end

      def load_from_data(data)
        if data.has_key?('date')
          @date = Time.at(data['date'].to_i / 1000).utc
        end

        @lot    = GreenLot.new(data['lot'])
        @weight = Weight.new(data['weight'])
      end
    end
  end
end
