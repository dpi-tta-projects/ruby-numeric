
RSpec.describe "superman_3.rb" do
  describe "program output" do
    it "prints the raw float (10% of input) and the rounded value" do
      stdout, stderr, status = run_script("./superman_3.rb", stdin: "1234.56\n")
      expect(status.exitstatus).to eq(0), "Program error: #{stderr}"

      lines = normalize_output(stdout)
      expect(lines.length).to eq(2)

      raw, rounded = lines
      expect(raw.to_f).to be_within(0.001).of(123.456)
      expect(rounded).to eq("123.46")
    end
  end

  describe "source code" do
    let(:src) { source_without_comments(File.read("superman_3.rb")) }

    it "uses * to compute 10 percent" do
      expect(src).to match(/\*/), "Use * to compute 10%."
    end

    it "rounds to two decimals with round(2)" do
      expect(src).to match(/\.round\(\s*2\s*\)/), "Use .round(2) to round to 2 decimals."
    end
  end
end
