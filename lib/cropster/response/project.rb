module Cropster::Response
  class Project < Cropster::Response::FormattedResponseItem
    attr_accessor :id, :name, :type, :description, :is_archived

    def initialize(data)
      super(data)
    end

    def load_from_data(data)
      super
      @type = data[:type]
    end

    def load_attributes(attributes)
      @name = attributes[:name]
      @description = attributes[:description]
      @is_archived = attributes[:isArchived]
    end
  end
end
