module Cropster::Response
  class ResponseHandler
    attr_accessor :data_set
    attr_accessor :compiled_data

    def initialize
      @compiled_data = []
    end

    def lots(data_set)
      @data_set = data_set
      compile_data_with_model('Lot')
    end

    def roast_batches(data_set)
      @data_set = data_set
      compile_data_with_model('RoastBatch')
    end

    def compile_data_with_model(model)
      model = Object.const_get("Cropster::Response::" + model)

      @data_set.each do |data|
        data.deep_symbolize_keys!
        @compiled_data << model.new(data) if !data.empty?
      end

      @compiled_data
    end
  end
end
