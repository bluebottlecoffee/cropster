module Cropster::Response
  class Source
    require 'cropster/response/green_lot'
    require 'cropster/response/weight'

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

      @lot    = Cropster::Response::GreenLot.new(data['lot'])
      @weight = Cropster::Response::Weight.new(data['weight'])
    end
  end
end
