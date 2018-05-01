module Cropster::Response
  class ResponseHandler
    attr_accessor :data_set
    attr_accessor :compiled_data

    def initialize(klass, data_set)
      @compiled_data = []
      @data_set = data_set
      compile_data(klass)
    end

    def compile_data(klass)
      model = Object.const_get("Cropster::Response::" + klass)

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
