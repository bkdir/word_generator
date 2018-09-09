RSpec.describe WordGenerator::WordList do
  before do
    stub_const("WordGenerator::WordList::FILE_PATH", "spec/fixtures/sample_words.txt")
  end

  describe ".contains?" do
    let(:word) { "home" }

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

  describe ".list" do
    it "returns list of English words" do
      expect(described_class.list.keys)
          .to match_array(%w(test hi hello home brown glue gin win legacy temporary))
    end

    context "when data source is not a file" do
      it "returns an empty list" do
        expect(described_class.list(data_source: :test)).to eq(%w())
      end
    end

    context "when called multiple times" do
      before do
        described_class.list
      end

      it "returns cached list of words" do
        expect(described_class).not_to receive(:read_words_from_file)
        described_class.list
      end
    end
  end
end
