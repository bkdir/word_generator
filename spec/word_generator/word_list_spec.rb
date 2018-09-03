RSpec.describe WordGenerator::WordList do
  describe "#contains" do
    let(:word) { "home" }
    before do
      stub_const("WordGenerator::WordList::FILE_PATH", "spec/fixtures/sample_words.txt")
    end

    it "checks if a given word exists in data store" do
      expect(described_class.contains?(word)).to be_truthy
    end

    context "when data store doesn't contain the word" do
      let(:word) { "blahbleh" }

      it "returns false" do
        expect(described_class.contains?(word)).to be_falsy
      end
    end
  end
end
