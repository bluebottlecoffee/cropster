module Cropster::Response
  class FormattedResponseItem
    attr_accessor :id, :type, :link
    attr_accessor :source_contacts, :sensorial_qcs, :projects,
      :varieties, :groups, :certificates, :alerts, :locations,
      :processings, :machines, :profiles, :lots

    def initialize(data)
      @sources = []
      @certifications = []
      load_from_data(data)
    end

    def load_from_data(data)
      @id = data[:id]
      load_attributes(data[:attributes])
      load_relationships(data[:relationships])
      load_links(data[:links])
    end

    def load_attributes(attributes); end

    def load_links(links)
      return if links.nil?
      return if links[:self].nil?
      @link = links[:self]
    end

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

    def load_price(data, base_data)
      Cropster::Response::Price.new(data, base_data)
    end

    def load_weight(attributes)
      Cropster::Response::Weight.new(attributes)
    end
  end
end

