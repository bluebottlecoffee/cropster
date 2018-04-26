module Cropster::Response

  class RoastBatch < Cropster::Response::FormattedResponseItem

    def initialize(data)
      super(data)
    end

    def total_green_weight_grams
      sources.sum { |s| s.weight.grams }
    end

    def total_roasted_weight_grams
      weight.grams
    end

    def green_to_roasted_weight_loss_percentage
      ( (1 - total_roasted_weight_grams / total_green_weight_grams) * 10000 ).round / 100.0
    end

  end

end
