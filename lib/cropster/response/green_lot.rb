module Cropster
  module Response
    class GreenLot < Cropster::Response::FormattedResponseItem
      def sourced_weight_grams
        sources.sum { |s| s.weight.grams } + initial_weight.grams
      end
    end
  end
end
