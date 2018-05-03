##
# Converts a Hash into a Cropster::Response::User object
#
module Cropster::Response
  class User < Cropster::Response::FormattedResponseItem
    attr_accessor :name, :email, :locale, :timezone, :active

    def load_attributes(attributes)
      return if attributes.nil?
      @name = attributes[:name]
      @email = attributes[:email]
      @locale = attributes[:locale]
      @timezone = attributes[:timezone]
      @active = attributes[:active]
    end

  end
end
