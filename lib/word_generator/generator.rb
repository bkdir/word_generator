module WordGenerator
  class Generator
    MIN_WORD_LENGTH = 3

    attr_reader :letters

    def initialize(letters)
      @letters = letters
    end

    def generate
      (MIN_WORD_LENGTH..letters.size).each_with_object({}) do |word_length, words|
        words[word_length] = valid_words(word_length)
      end
    end

    private

    def valid_words(word_length)
      word_permutations(word_length).select { |word| WordList.contains?(word) }
    end

    def word_permutations(len)
      letters.permutation(len).to_a.map(&:join).uniq
    end
  end
end
