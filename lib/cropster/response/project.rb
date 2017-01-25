module Cropster
  module Response
    class Project
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
