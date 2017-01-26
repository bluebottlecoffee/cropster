module Cropster
  class Configuration
    def self.name_ico_separators=(separator)
      if separator.length != 2
        raise ArgumentError, "separator must be two characters"
      end

      @name_ico_separators = separator
    end

    def self.name_ico_separators
      @name_ico_separators ||= '[]'
    end
  end
end
