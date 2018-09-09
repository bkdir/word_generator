module WordGenerator
  class Configuration
    MAX_WORD_LENGTH = 9
    DATA_SOURCE = :file

    attr_accessor :max_word_length, :data_source

    def initialize
      @max_word_length = MAX_WORD_LENGTH
      @data_source = DATA_SOURCE
    end
  end
end
