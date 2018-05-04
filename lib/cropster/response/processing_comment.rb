##
# Converts a Hash into a Cropster::Response::ProcessingComment
#
module Cropster::Response
  class ProcessingComment < Cropster::Response::FormattedResponseItem
    attr_accessor :note, :created_at, :time, :event

    def load_attributes(attributes)
      return if attributes.nil?
      @note = attributes[:note]
      @created_at = load_date(attributes[:createdDate])
      @event = attributes[:event]
      @time = load_time(attributes[:time])
    end
  end
end
