
RSpec.describe "float_quirk.rb" do
  describe "output" do
    it "prints 0.1 + 0.2 (floaty business)" do
      output = run_script_and_capture_lines("float_quirk.rb")

      output_as_float = Float(output[0]) rescue nil
      expect(output_as_float).not_to be_nil, "Please print a number (use pp)."
      expect(output_as_float).to be_within(1e-12).of(0.3), "It should be very close to 0.3 (but not always exactly)."
    end
  end

  describe "code" do
    it "adds the numeric literals 0.1 and 0.2" do
      source_code = strip_comments(File.read("float_quirk.rb"))

      expect(source_code).to match(/\b0\.1\b/), "Use the literal 0.1."
      expect(source_code).to match(/\b0\.2\b/), "Use the literal 0.2."
      expect(source_code).to match(/\+\s*/),    "Use + to add them."
    end
  end
end
