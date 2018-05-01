module Cropster
  class Contact < Cropster::Base
    def contact(id)

    end

    def contacts(opts={})

    end

    def process(response)
      Cropster::Response::ResponseHandler.new("Contact", data_set(resposne))
    end
  end
end
