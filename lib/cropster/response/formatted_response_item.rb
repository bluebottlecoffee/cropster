module Cropster
  module Response
    class FormattedResponseItem
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
        if m = name.match(ico_regex)
          m[1]
        end
      end

      def name_sans_ico
        if ico
          name.gsub(/#{ico_start}.*\z/, '').strip
        else
          name
        end
      end

      def organic?
        @certifications.join(' ').downcase.include?('organic')
      end

      private

      def ico_regex
        /#{ico_start}([^#{ico_stop}]*)#{ico_stop}/
      end

      def ico_start
        Regexp.escape(Configuration.name_ico_separators[0])
      end

      def ico_stop
        Regexp.escape(Configuration.name_ico_separators[1])
      end
    end
  end
end
