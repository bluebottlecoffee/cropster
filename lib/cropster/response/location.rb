module Cropster::Response
  class Location
    attr_accessor :id, :name

    def initialize(data)
      load_from_data(data)
    end

    def load_from_data(data)
      @id   = data['id'].present? ? data['id'].to_i : 0
      @name = data['name']
    end
  end
end
