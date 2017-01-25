module Cropster
  module Response
    class Location
      attr_accessor :id,
                    :name

      def initialize(data)
        load_from_data(data || {})
      end

      def load_from_data(data)
        @id   = data['id'].to_i
        @name = data['name']
      end
    end
  end
end
