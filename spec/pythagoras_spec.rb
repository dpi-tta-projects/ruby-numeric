
RSpec.describe "pythagoras.rb" do
  describe "output" do
    it "prints the hypotenuse for 2 and 2, rounded to 2 decimals" do
      output = run_script_and_capture_lines("pythagoras.rb", stdin: "2\n2\n")

      expect(output.first).to eq("2.83")
    end

    it "prints the classic 3-4-5 triangle hypotenuse" do
      output = run_script_and_capture_lines("pythagoras.rb", stdin: "3\n4\n")

      expect(output.first).to eq("5.0")
    end
  end

  describe "code" do
    let(:source_code) { strip_comments(File.read("pythagoras.rb")) }

    it "uses ** for squaring" do
      expect(source_code.scan(/\*\*/).length).to be >= 1, "Use ** for squaring."
    end

    it "uses Math.sqrt for the square root" do
      expect(source_code).to match(/\bMath\.sqrt\b/), "Use Math.sqrt to compute the square root."
    end

    it "rounds to two decimals with round(2)" do
      expect(source_code).to match(/\.round\(\s*2\s*\)/), "Round the result to 2 decimals with round(2)."
    end
  end
end
