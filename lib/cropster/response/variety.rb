module Cropster::Response
  class Variety < Cropster::Response::FormattedResponseItem
    attr_accessor :id, :type, :name, :product_type

    def initialize(data)
      super(data)
    end

    def load_from_data(data)
      super
      @type = data[:type]
    end

    def load_attributes(attributes)
      @name = attributes[:name]
      @product_type = attributes[:productType]
    end
  end
end
