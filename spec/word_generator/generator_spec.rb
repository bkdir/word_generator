RSpec.describe WordGenerator::Generator do
  describe "#generate" do
    let(:letters) { %w(b o w n r) }
    let(:result) do
      {
        3 => ["bow", "bon", "bor", "bro", "own", "orb", "won", "nob", "now", "nor", "rob", "row"], 
        4 => ["bowr", "born", "brow", "worn"], 
        5 => ["brown"]
      }
    end

    it "generates words based on provided letters" do
      generator = described_class.new(letters)
      expect(generator.generate).to eq(result)
    end
  end
end
