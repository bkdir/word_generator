module WordGenerator
  class Generator
    attr_reader :letters

    def initialize(letters)
      @letters = letters
    end

    def generate(word_length)
      possible_words(word_length).select { |word| WordList.contains?(word) }
    end

    private

    def possible_words(word_length)
      @letters.permutation(word_length).to_a.map(&:join).uniq.sort
    end
  end
end
