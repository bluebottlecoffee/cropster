##
# Converts a Hash into a Cropster::Response::Lot object
#
module Cropster::Response
  class Lot < Cropster::Response::FormattedResponseItem
    attr_accessor :id_tag, :name, :created_at, :consumed_at,
                  :location, :weight, :price, :project,
                  :initial_weight, :tracking_number, :grade, :sales_number,
                  :notes, :processing_step, :purchase_order_number

    def load_from_data(data)
      super
    end

    def load_attributes(attributes)
      return if attributes.nil?
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

    def fairtrade?
      @certifications.join(' ').downcase.include?('fairtrade')
    end

    def sourced_weight_grams
      sources.sum { |s| s.weight.grams } + initial_weight.grams
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

    def ico
      if @name.include?('[') && @name.include?(']')
        @name.gsub(/^(.+?)\[/, '').gsub(/[.+?\]]*/, '')
      elsif name_ico_separators.size >= 2
        name_raw_ico_component.gsub('/','-').gsub('--','-')
      else
        ''
      end
    end
  end
end
