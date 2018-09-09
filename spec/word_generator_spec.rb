RSpec.describe WordGenerator do
  it "has a version number" do
    expect(WordGenerator::VERSION).not_to be nil
  end

  describe ".configure" do
    it "should be configurable" do
      described_class.configure do |config|
        config.max_word_length = 7
        config.data_source = :test
      end

      expect(described_class.configuration.max_word_length).to eq(7)
      expect(described_class.configuration.data_source).to eq(:test)
    end
  end

  describe ".configuration" do
    it "returns the configuration with defaults" do
      config = described_class.configuration 
      expect(config.data_source).not_to be_nil
      expect(config.max_word_length).not_to be_nil
    end
  end
end
