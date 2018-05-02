##
# Provides the interface between the results from the API query and the
# conversion of the Hash to a Ruby object
#
module Cropster::Response
  class ResponseHandler
    attr_accessor :data_set
    attr_accessor :compiled_data

    # Constructor
    # @param klass [String] the class being converted
    # @data_set [Hash | Array] the result from the API
    def initialize(klass, data_set)
      @compiled_data = []
      @data_set = data_set
      compile_data(klass)
    end

    # Builds the object to be compiled
    # @param klass [String] the class being converted
    def compile_data(klass)
      model = Object.const_get("Cropster::Response::" + klass)

      process(model, @data_set)
      @compiled_data
    end

    # Processes the Hash or Array from the API into ruby objects
    # @param model [Object] the object being constructed
    # @data_set [Hash | Array] the data to be converted
    def process(model, data_set)
      if @data_set.is_a?(Array)
        @data_set.each do |data|
          process_data(model, data)
        end
      else
        process_data(model, @data_set)
      end
    end

    # Converts the Hash into symbols and then converts the object
    # @param model [Object] the object being constructed
    # @param data [Hash] the data to be converted
    def process_data(model, data)
      data.deep_symbolize_keys!
      @compiled_data << model.new(data) if !data.empty?
    end
  end
end
