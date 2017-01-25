module Cropster
  module Response
    class FormattedResponseItem
      require 'cropster/response/location'
      require 'cropster/response/weight'
      require 'cropster/response/project'
      require 'cropster/response/source'

      attr_accessor :id,
                    :id_tag,
                    :name,
                    :created_at,
                    :location,
                    :sources,
                    :weight,
                    :project,
                    :initial_weight,
                    :certifications

      def initialize(data)
        @sources = []
        @certifications = []
        @id             = data.fetch('id', 0).to_i
        @id_tag         = data['idTag']
        @name           = data['name']

        if data.has_key?('creationDate')
          @created_at = Time.at(data['creationDate'].to_i / 1000).utc
        end

        @location = Cropster::Response::Location.new(data['location'])
        @weight = Cropster::Response::Weight.new(data['weight'])
        @initial_weight = Cropster::Response::Weight.new(data['initialWeight'])
        @project = Cropster::Response::Project.new(data['project'])
        @certifications = data['certifications']

        data.fetch('sources', []).each do |source_data|
          @sources << Cropster::Response::Source.new(source_data)
        end
      end

      def fairtrade?
        @certifications.join(' ').downcase.include?('fairtrade')
      end

      def ico
        if @name.include?('[') && @name.include?(']')
          @name.gsub(/^(.+?)\[/, '').gsub(/[.+?\]]*/, '')
        elsif name_ico_separators.size >= 2
          name_raw_ico_component.gsub('/','-').gsub('--','-')
        else
          ''
        end
      end

      def name_ico_separators
        @name.gsub(/[?a-zA-Z0-9 ]/, '')
      end

      def name_raw_ico_component
        @name.gsub(/[?a-z,A-Z]/, '').split(' ').last || ""
      end

      def name_sans_ico
        name.
          gsub("[#{name_raw_ico_component}]",'').
          gsub(name_raw_ico_component, '').
          gsub(/organic/i, '')
      end

      def organic?
        @certifications.join(' ').downcase.include?('organic')
      end
    end
  end
end
