module Cropster::Response

  class FormattedResponseItem
    require 'cropster/response/location'
    require 'cropster/response/weight'
    require 'cropster/response/project'
    require 'cropster/response/source'

    attr_accessor :id, 
                  :id_tag,
                  :name,
                  :creation_date,
                  :location,
                  :sources,
                  :weight,
                  :project,
                  :initial_weight,
                  :certifications

    def initialize(data)
      @sources = []
      load_from_data(data)
    end

    def ico
      # One day maybe there will be a real ico property
      @name.include?('[') && @name.include?(']') ? @name.gsub(/^(.+?)\[/, '').gsub(/[.+?\]]*/, '') : ''
    end

    def load_from_data(data)
      @id             = data['id'].present? ? data['id'].to_i : 0
      @id_tag         = data['idTag']
      @name           = data['name']
      @creation_date  = data['creationDate'].present? ? Time.at(data['creationDate'].to_i / 1000).utc : nil
      @location       = Cropster::Response::Location.new(data['location'])    if data['location'].present?
      @weight         = Cropster::Response::Weight.new(data['weight'])        if data['weight'].present?
      @initial_weight = Cropster::Response::Weight.new(data['initialWeight']) if data['initialWeight'].present?
      @project        = Cropster::Response::Project.new(data['project'])      if data['project'].present?

      if data['sources'].present? && !data['sources'].empty?
        data['sources'].each do |source_data| 
          @sources << Cropster::Response::Source.new(source_data)
        end
      end
    end
  end

end