RSpec.describe WordGenerator::Generator do
  describe "#generate" do
    let(:letters) { %w(b o w n r) }

    it "generates words based on provided letters and length" do
      generator = described_class.new(letters, 5)
      expect(generator.generate).to eq(["brown"])

      generator = described_class.new(letters, 3)
      expect(generator.generate).to eq(%w(bow bon bor bro own orb won nob now nor rob row))
    end
  end
end
