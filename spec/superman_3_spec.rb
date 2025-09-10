
RSpec.describe "superman_3.rb" do
  describe "output" do
    it "prints the raw float (10% of input) and the rounded value" do
      output = run_script_and_capture_lines("superman_3.rb", stdin: "1234.56\n")

      expect(output.length).to eq(2)

      raw = output[0]
      rounded = output[1]
      expect(raw).to be_within(0.001).of(123.456)
      expect(rounded).to eq("123.46")
    end
  end

  describe "code" do
    let(:source_code) { strip_comments(File.read("superman_3.rb")) }

    it "uses * to compute 10 percent" do
      expect(source_code).to match(/\*/), "Use * to compute 10%."
    end

    it "rounds to two decimals with round(2)" do
      expect(source_code).to match(/\.round\(\s*2\s*\)/), "Use .round(2) to round to 2 decimals."
    end
  end
end
