module WordGenerator
  class Generator
    class WordLengthTooLongError < StandardError; end

    attr_reader :letters

    def initialize(letters)
      @letters = parse_letters(letters)
    end

    def generate(word_length)
      max_word_length = WordGenerator.configuration.max_word_length
      if word_length > max_word_length
        raise WordLengthTooLongError, "Word length cannot be longer than #{max_word_length}"
      end

      possible_words(word_length).select { |word| WordList.contains?(word) }
    end

    private

    def parse_letters(letters)
      letters_string = 
        if letters.is_a?(String)
          letters
        elsif letters.is_a?(Array)
          letters.join
        else
          raise ArgumentError.new("String or Array of letters should be provided")
        end
      letters_string.gsub(/[^a-z]/i, "").split("")
    end

    def possible_words(word_length)
      @letters.permutation(word_length).to_a.map(&:join).uniq.sort
    end
  end
end
