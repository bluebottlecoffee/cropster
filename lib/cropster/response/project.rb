module Cropster::Response
  class Project < Cropster::Response::FormattedResponseItem
    attr_accessor :name, :description, :is_archived

    def load_attributes(attributes)
      @name = attributes[:name]
      @description = attributes[:description]
      @is_archived = attributes[:isArchived]
    end
  end
end
