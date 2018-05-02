##
# Converts a Hash object into a Cropster::Response::Contact
#
module Cropster::Response
  class Contact < Cropster::Response::FormattedResponseItem
    attr_accessor :first_name, :last_name, :company_name,
      :name, :street, :city, :zip, :state, :country, :phone, :mobile, :fax,
      :email, :website

    # @param attributes [Hash]
    def load_attributes(attributes)
      return if attributes.nil?

      @first_name = attributes[:firstName]
      @last_name = attributes[:lastName]
      @company_name = attributes[:companyName]
      @name = attributes[:name]
      @street = attributes[:street]
      @city = attributes[:city]
      @zip = attributes[:zip]
      @country = attributes[:country]
      @phone = attributes[:phone]
      @mobile = attributes[:mobile]
      @fax = attributes[:fax]
      @email = attributes[:email]
      @website = attributes[:website]
    end
  end
end
