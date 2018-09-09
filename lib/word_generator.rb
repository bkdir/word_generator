require "word_generator/configuration"
require "word_generator/version"
require "word_generator/word"
require "word_generator/word_list"
require "word_generator/generator"

module WordGenerator
  MAX_WORD_LENGTH = 9

  class << self
    attr_accessor :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.reset
    @configuration = Configuration.new
  end

  def self.configure
    yield(configuration)
  end
end

