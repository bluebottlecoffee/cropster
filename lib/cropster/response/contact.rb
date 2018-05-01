module Cropster::Response
  class Contact < Cropster::Response::FormattedResponseItem
    attr_accessor :id, :type, :first_name, :last_name, :company_name,
      :name, :street, :city, :zip, :state, :country, :phone, :mobile, :fax,
      :email, :website

    def intialize(data)
      super(data)
    end

    def load_from_data(data)
      super
      @type = data[:type]
    end

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
