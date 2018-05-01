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

    def processings(data_set)
      @data_set = data_set
      compile_data_with_model('Processing')
    end

    def locations(data_set)
      @data_set = data_set
      compile_data_with_model("Location")
    end

    def compile_data_with_model(model)
      model = Object.const_get("Cropster::Response::" + model)

      process(model, @data_set)
      @compiled_data
    end

    def process(model, data_set)
      if @data_set.is_a?(Array)
        @data_set.each do |data|
          process_data(model, data)
        end
      else
        process_data(model, @data_set)
      end
    end

    def process_data(model, data)
      data.deep_symbolize_keys!
      @compiled_data << model.new(data) if !data.empty?
    end
  end
end
