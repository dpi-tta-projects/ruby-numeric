
RSpec.describe "predicates.rb" do
  describe "output" do
    it "prints correct truth values for 0" do
      output = run_script_and_capture_lines("predicates.rb", stdin: "0\n")

      expect(output).to eq(%w[true false true])
    end

    it "prints correct truth values for 5" do
      output = run_script_and_capture_lines("./predicates.rb", stdin: "5\n")

      expect(output).to eq(%w[false true false])
    end
  end

  describe "code" do
    let(:source_code) { strip_comments(File.read("predicates.rb")) }

    it "calls even? on the number" do
      expect(source_code).to match(/even\?/), "Use n.even?."
    end

    it "calls odd? on the number" do
      expect(source_code).to match(/.odd\?/), "Use n.odd?."
    end

    it "calls zero? on the number" do
      expect(source_code).to match(/zero\?/), "Use n.zero?."
    end
  end
end
