module Cropster::Response

  class ResponseHandler
    require 'cropster/response/green_lot'
    require 'cropster/response/roast_batch'

    attr_accessor :data_set
    attr_accessor :compiled_data

    def initialize
      @compiled_data = []
    end

    def green_lots(data_set)
      @data_set = data_set
      compile_data_with_model('GreenLot')
    end

    def roast_batches(data_set)
      @data_set = data_set
      compile_data_with_model('RoastBatch')
    end

    def compile_data_with_model(model)
      model = Object.const_get("Cropster::Response::" + model)

      data_set.each do |data|
        @compiled_data << model.new(data) if !data.empty?
      end

      @compiled_data
    end
  end

end
