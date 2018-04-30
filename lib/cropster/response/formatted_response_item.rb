module Cropster::Response
  class FormattedResponseItem
    def initialize(data)
      @sources = []
      @certifications = []
      load_from_data(data)
    end

    def load_from_data(data)
      @id = data[:id]
      load_attributes(data[:attributes])
    end

    def load_attributes(attributes); end

    def load_location(data)
      return if data[:data].nil?
      @location = Cropster::Response::Location.new(data[:data])
    end

    def load_project(data)
      return if data[:data].nil?
      @project = Cropster::Response::Project.new(data[:data])
    end

    def load_certificates(data)
      return if data[:data].nil?
      # @certifications = data[:certifications]
    end

    def load_sources(data)
      return if data.empty?
      data.each do |source_data|
        @sources << Cropster::Response::Source.new(source_data)
      end
    end

    def load_date(date)
      return nil if date.nil?
      Time.at(date.to_i / 1000).utc
    end

    def load_price(data, base_data)
      Cropster::Response::Price.new(data, base_data)
    end

    def load_weight(attributes)
      Cropster::Response::Weight.new(attributes)
    end
  end
end

