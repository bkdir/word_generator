require "bundler/setup"
require "word_generator"

while true do
  puts "Enter Letters to generate words:"

  letter_list = gets.chomp
  generator = WordGenerator::Generator.new(letter_list)

  word_list = (3..letter_list.size).each_with_object({}) do |word_length, result|
    result[word_length] = generator.generate(word_length)
  end

  word_list.each do |key, val|
    puts "#{key} letters ---> #{val.join(", ")}"
  end
end
