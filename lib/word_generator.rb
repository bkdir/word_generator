require "word_generator/version"

module WordGenerator
  def self.read_words_from(file)
    words = {}
		File.open("data/words.txt", "r") do |f|
			f.each_line do |line|
        words[line.chomp] = 1
			end
		end
    words
  end

  def self.permutations_for_a_range(input)
    (3..input.size).inject({}) do |permutations, letters|
      permutations[letters] = input.permutation(letters).to_a.map(&:join)
      permutations
    end
  end

  def self.generate(input)
    words = read_words_from("data/words.txt")
    permutations = permutations_for_a_range(input)

    new_hash = {}
    permutations.each do |letters, possible_words|
      english_words = possible_words.select{|word| !words[word].nil? }.uniq.sort
      new_hash[letters] = english_words
    end
    new_hash
  end
end

while true do
  puts "Enter Letters:"

  input = gets.chomp.split("")
  word_perm = WordGenerator.generate(input)

  word_perm.each do |key, val|
    puts "#{key} letters ---> #{val.join(", ")}"
  end
end
