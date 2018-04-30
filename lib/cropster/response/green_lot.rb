module Cropster::Response
  class GreenLot < Cropster::Response::FormattedResponseItem
    def initialize(data)
      super(data)
    end

    def sourced_weight_grams
      sources.sum { |s| s.weight.grams } + initial_weight.grams
    end
  end
end
