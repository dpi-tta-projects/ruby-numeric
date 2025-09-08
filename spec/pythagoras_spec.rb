
RSpec.describe "pythagoras.rb" do
  describe "output" do
    it "prints the hypotenuse for 2 and 2, rounded to 2 decimals" do
      stdout, stderr, status = run_script("./pythagoras.rb", stdin: "2\n2\n")
      expect(status.exitstatus).to eq(0), "Program error: #{stderr}"

      # numbers are printed (no quotes); normalize_output is safe to use
      lines = normalize_output(stdout)
      expect(lines.join).to eq("2.83")
    end

    it "prints the classic 3-4-5 triangle hypotenuse" do
      stdout, stderr, status = run_script("./pythagoras.rb", stdin: "3\n4\n")
      expect(status.exitstatus).to eq(0), "Program error: #{stderr}"

      lines = normalize_output(stdout)
      expect(lines.join).to eq("5.0")
    end
  end

  describe "code" do
    let(:src) { source_without_comments(File.read("pythagoras.rb")) }

    it "uses ** for squaring" do
      expect(src.scan(/\*\*/).length).to be >= 1, "Use ** for squaring."
    end

    it "uses Math.sqrt for the square root" do
      expect(src).to match(/\bMath\.sqrt\b/), "Use Math.sqrt to compute the square root."
    end

    it "rounds to two decimals with round(2)" do
      expect(src).to match(/\.round\(\s*2\s*\)/), "Round the result to 2 decimals with round(2)."
    end
  end
end
