module Cropster::Response

  require 'cropster/response/formatted_response_item'

  class GreenLot < Cropster::Response::FormattedResponseItem

    def initialize(data)
      super(data)
    end

    def sourced_weight_grams
      sources.sum { |s| s.weight.grams } + initial_weight.grams
    end

  end
  
end