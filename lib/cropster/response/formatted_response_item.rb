module Cropster::Response

  class FormattedResponseItem

    attr_accessor :id,
                  :id_tag,
                  :type,
                  :name,
                  :created_at,
                  :consumed_at,
                  :location,
                  :sources,
                  :weight,
                  :price,
                  :project,
                  :initial_weight,
                  :tracking_number,
                  :grade,
                  :sales_number,
                  :notes,
                  :processing_step,
                  :purchase_order_number,
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
      # data = data[1][0]
      @id = data[:id]
      @type = data[:type]
      load_attributes(data[:attributes])
      load_location(data[:relationships][:location])
      load_project(data[:relationships][:project])
    end

    def load_attributes(attributes)
      @is_sample = attributes[:isSample]
      @id_tag = attributes[:idTag]
      @tracking_number = attributes[:trackingNumber]
      @name = attributes[:name]
      @notes = attributes[:notes]
      @sales_number = attributes[:salesNumber]
      @grade = attributes[:grade]
      @processing_step = attributes[:processingStep]
      @purchase_order_number = attributes[:purchaseOrderNumber]
      @created_at = load_date(attributes[:creationDate])
      @consumed_at = load_date(attributes[:consumedDate])
      @weight = load_weight(attributes[:actualWeight])
      @initial_weight = load_weight(attributes[:initialWeight])
      @price = load_price(attributes[:price], attributes[:priceBaseUnit])
    end

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

