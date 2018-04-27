module Cropster::Response
  class Source

    attr_accessor :date, :lot, :weight

    def initialize(data)
      load_from_data(data)
    end

    def load_from_data(data)
      @date   = data['date'].present? ? Time.at(data['date'].to_i / 1000).utc : nil
      @lot    = Cropster::Response::GreenLot.new(data['lot'])
      @weight = Cropster::Response::Weight.new(data['weight'])
    end
  end

end
