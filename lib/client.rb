require "bundler/setup"
require "word_generator"

while true do
  puts "Enter Letters to generate words:"

  letter_list = gets.chomp.split("")
  max_size = WordGenerator::MAX_WORD_LENGTH
  if letter_list.size > max_size
    puts "Input can't be longer than #{max_size} letters"
    next
  end
  generator = WordGenerator::Generator.new(letter_list)
  word_list = generator.generate

  word_list.each do |key, val|
    puts "#{key} letters ---> #{val.join(", ")}"
  end
end
