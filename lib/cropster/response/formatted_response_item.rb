module Cropster::Response

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
      load_from_data(data)
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

    def load_from_data(data)
      @id             = data['id'].present? ? data['id'].to_i : 0
      @id_tag         = data['idTag']
      @name           = data['name']
      @created_at     = data['creationDate'].present? ? Time.at(data['creationDate'].to_i / 1000).utc : nil
      @location       = Cropster::Response::Location.new(data['location'])    if data['location'].present?
      @weight         = Cropster::Response::Weight.new(data['weight'])        if data['weight'].present?
      @initial_weight = Cropster::Response::Weight.new(data['initialWeight']) if data['initialWeight'].present?
      @project        = Cropster::Response::Project.new(data['project'])      if data['project'].present?
      @certifications = data['certifications']

      if data['sources'].present? && !data['sources'].empty?
        data['sources'].each do |source_data| 
          @sources << Cropster::Response::Source.new(source_data)
        end
      end
    end

    def name_ico_separators
      @name.gsub(/[?a-zA-Z0-9 ]/, '')
    end

    def name_raw_ico_component
      @name.gsub(/[?a-z,A-Z]/, '').split(' ').last.presence || ""
    end

    def name_sans_ico
      n = ico.present? ? name.gsub("[#{name_raw_ico_component}]",'').gsub(name_raw_ico_component, '') : name
      n.gsub('Organic', '').gsub('ORGANIC','')
    end

    def organic?
      @certifications.join(' ').downcase.include?('organic')
    end
  end

end
