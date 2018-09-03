RSpec.describe WordGenerator do
  it "has a version number" do
    expect(WordGenerator::VERSION).not_to be nil
  end

  it "should define max word length" do
    expect(described_class::MAX_WORD_LENGTH).to eq(9)
  end
end
