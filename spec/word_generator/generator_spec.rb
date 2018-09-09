RSpec.describe WordGenerator::Generator do
  let(:letters) { %w(b o w n r) }
  subject { described_class.new(letters) }

  describe "#initialize" do
    context "when letters are Array" do
      let(:letters) { %w(h o m e 1 !) }

      it "should filter letters properly" do
        expect(subject.letters).to eq(%w(h o m e))
      end
    end

    context "when letters are String" do
      let(:letters) { "hmoe481!" }

      it "should filter letters properly" do
        expect(subject.letters).to eq(%w(h m o e))
      end
    end
  end

  describe "#generate" do
    it "generates words based on provided length" do
      expect(subject.generate(5)).to eq(["brown"])
      expect(subject.generate(3)).to eq(%w(bon bor bow bro nob nor now orb own rob row won))
    end

    context "when provided word length is too long" do
      it "should raise an exception" do
        expect { subject.generate(10) }.to raise_error(described_class::WordLengthTooLongError)
      end
    end
  end
end
