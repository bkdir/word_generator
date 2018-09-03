module WordGenerator
  class WordList
    VALID_WORD_REGEX = /^\b[a-zA-Z0-9_]+\b$/
    FILE_PATH = "data/words.txt".freeze

    def self.contains?(word)
      !list_of_words[word].nil?
    end

    private

    def self.list_of_words
      return @list_of_words if @list_of_words
      @list_of_words = read_words_from_file
    end

    def self.read_words_from_file
      File.foreach(FILE_PATH).with_object({}) do |line, result|
        word = line.chomp!
        next unless VALID_WORD_REGEX.match?(word)
        result[word] = 1
      end
    end
  end
end
