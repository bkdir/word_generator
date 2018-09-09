module WordGenerator
  class WordList
    VALID_WORD_REGEX = /^\b[a-zA-Z0-9_]+\b$/
    FILE_PATH = "data/words.txt".freeze
    
    def self.contains?(word)
      data_source = WordGenerator.configuration.data_source
      !list(data_source: data_source)[word].nil?
    end

    def self.list(data_source: :file)
      return [] unless data_source == :file
      @list_of_words ||= read_words_from_file
    end

    private

    def self.read_words_from_file
      path = File.expand_path("../#{FILE_PATH}", File.dirname(__dir__))

      File.foreach(path).with_object({}) do |line, result|
        word = line.chomp!
        result[word] = 1 if VALID_WORD_REGEX.match?(word)
      end
    end
  end
end
