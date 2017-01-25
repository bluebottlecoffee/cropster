module Cropster
  module Response
    class Location
      def initialize(data)
        @data = data || {}
      end

      def id
        @data['id'].to_i
      end

      def name
        @data['name']
      end
    end
  end
end
