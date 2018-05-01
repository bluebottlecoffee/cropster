module Cropster::Response
  class Location < Cropster::Response::FormattedResponseItem
    attr_accessor :id, :type, :name, :street, :zip, :city, :country

    def initialize(data)
      super(data)
    end

    def load_from_data(data)
      super
      @type = data[:type]
    end

    def load_attributes(attributes)
      return if attributes.nil?
      @name = attributes[:name]
      @street = attributes[:street]
      @zip = attributes[:zip]
      @city = attributes[:city]
      @country = attributes[:country]
    end
  end
end
