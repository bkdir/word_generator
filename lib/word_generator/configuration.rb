module WordGenerator
  class Configuration
    attr_accessor :max_word_length

    def initialize
      @max_word_length = WordGenerator::MAX_WORD_LENGTH 
    end
  end
end
