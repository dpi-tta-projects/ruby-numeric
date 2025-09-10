
RSpec.describe "calculator.rb" do
  describe "output" do
    it "prints results in order (+, -, *, /, %, **)" do
      output = run_script_and_capture_lines("./calculator.rb", stdin: "7\n3\n")
      expect(output).to eq(%w[10 4 21 2 1 343])
    end
  end

  describe "code" do
    it "uses the actual operators (+, -, *, /, %, and **)" do
      source_code = strip_comments(File.read("calculator.rb"))
      expect(source_code).to match(/\+/),   "Use + for addition."
      expect(source_code).to match(/-/),    "Use - for subtraction."
      expect(source_code).to match(/\*/),   "Use * for multiplication."
      expect(source_code).to match(%r{/}),  "Use / for integer division."
      expect(source_code).to match(/%/),    "Use % for remainder."
      expect(source_code).to match(/\*\*/), "Use ** for exponentiation."
    end
  end
end
