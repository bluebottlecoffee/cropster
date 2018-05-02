##
# Converts a Hash object into a Cropster::Response::Location object
#
module Cropster::Response
  class Location < Cropster::Response::FormattedResponseItem
    attr_accessor :name, :street, :zip, :city, :country

    # @param attributes [Hash]
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
