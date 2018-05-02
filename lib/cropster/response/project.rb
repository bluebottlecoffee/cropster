##
# Converts a Hash into a Cropster::Response::Project
#
module Cropster::Response
  class Project < Cropster::Response::FormattedResponseItem
    attr_accessor :name, :description, :is_archived

    def load_attributes(attributes)
      return if attributes.nil?
      @name = attributes[:name]
      @description = attributes[:description]
      @is_archived = attributes[:isArchived]
    end
  end
end
