
RSpec.describe "divide.rb" do
  describe "output" do
    it "prints integer division then float division" do
      output = run_script_and_capture_lines("divide.rb", stdin: "5\n2\n")

      expect(output[0]).to eq("2"),   "Integer division 5/2 should be 2."
      expect(output[1]).to eq("2.5"), "Float division 5/2.0 should be 2.5."
    end
  end

  describe "code" do
    it "uses to_f (or b.to_f) for float division" do
      source_code = strip_comments(File.read("divide.rb"))

      expect(source_code).to match(%r{/\s*\w+\.to_f\b}), "Use .to_f on the denominator for float division."
    end
  end
end
