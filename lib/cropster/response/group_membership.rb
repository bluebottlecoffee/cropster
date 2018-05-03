#
# Converts a Hash into a Cropster::Response::GroupMembership object
#
module Cropster::Response
  class GroupMembership < Cropster::Response::FormattedResponseItem
    attr_accessor :created_at

    def load_attributes(attributes)
      return if attributes.nil?
      @created_at = load_date(attributes[:createdDate])
    end
  end
end
