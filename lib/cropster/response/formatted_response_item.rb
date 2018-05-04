##
# The parent class for the various Cropster::Response classes
#
module Cropster::Response
  class FormattedResponseItem
    attr_accessor :id, :type, :link
    attr_accessor :source_contacts, :sensorial_qcs, :projects,
      :varieties, :groups, :certificates, :alerts, :locations,
      :processings, :machines, :profiles, :lots

    # Constructor
    # @param data [Hash] the data to convert into a Cropster::Response subclass
    def initialize(data)
      @sources = []
      @certifications = []
      load_from_data(data)
    end

    # Copies the data from the Hash into the object attributes
    # @param data [Hash]
    def load_from_data(data)
      @id = data[:id]
      @type = data[:type]
      load_attributes(data[:attributes])
      load_relationships(data[:relationships])
      load_links(data[:links])
    end

    # Placeholder function to be overridden
    def load_attributes(attributes); end

    # Loads any referential link for the object in question
    # @param links [Hash]
    def load_links(links)
      return if links.nil?
      return if links[:self].nil?
      @link = links[:self]
    end

    # Parses the relationships Hash
    # @param relationships [Hash] the hash returned with the object attributes
    def load_relationships(relationships)
      relationships = Cropster::Response::Relationship.new(relationships).result
      @source_contacts = relationships[:source_contacts]
      @sensorial_qcs = relationships[:sensorial_qcs]
      @projects = relationships[:projects]
      @varieties = relationships[:varieties]
      @groups = relationships[:groups]
      @certificates = relationships[:certificates]
      @alerts = relationships[:alerts]
      @locations = relationships[:locations]
      @processings = relationships[:processings]
      @machines = relationships[:machines]
      @profiles = relationships[:profiles]
      @lots = relationships[:lots]
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

    def load_time(time)
      time.to_i / 1000
    end

    def load_values(values)
      result = []
      values.each do |value|
        result << {
          time: load_time(value[:time]),
          value: value[:value]
        }
      end
      result
    end

    # Converts the price Hash to a Cropster::Response::Price object
    # @param data [Hash] the price data
    # @param base_data [Hash] information about the currency
    # @return Cropster::Response::Price
    def load_price(data, base_data)
      Cropster::Response::Price.new(data, base_data)
    end

    # Converts the weight Hash to a Cropster::Response::Weight object
    # @param attributes [Hash] the weight data
    # @return Cropster::Response::Weight
    def load_weight(attributes)
      Cropster::Response::Weight.new(attributes)
    end
  end
end

