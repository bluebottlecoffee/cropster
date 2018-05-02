##
# Converts a Hash into a Cropster::Response::Processing object that represents
# a Roast instance
#
module Cropster::Response
  class Processing < Cropster::Response::FormattedResponseItem
    attr_accessor :worker, :started_at, :ended_at, :duration,
      :notes, :start_weight, :end_weight, :measures, :comments

    def load_from_data(data)
      super
      load_measures(data[:attributes][:measures])
      load_comments(data[:attributes][:comments])
    end

    def load_attributes(attributes)
      @worker = attributes[:worker]
      @started_at = load_date(attributes[:startedDate])
      @ended_at = load_date(attributes[:endedDate])
      @duration = attributes[:duration]
      @notes = attributes[:notes]
      @start_weight = load_weight(attributes[:startWeight])
      @end_weight = load_weight(attributes[:endWeight])
    end

    def load_measures(measures)
      @measures = measures
    end

    def load_comments(comments)
      @comments = comments
    end

    def total_green_weight_grams
      sources.sum { |s| s.weight.grams }
    end

    def total_roasted_weight_grams
      weight.grams
    end

    def green_to_roasted_weight_loss_percentage
      ( (1 - total_roasted_weight_grams / total_green_weight_grams) * 10000 ).round / 100.0
    end
  end
end
