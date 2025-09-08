# spec/predicates_spec.rb
require "spec_helper"

RSpec.describe "predicates.rb" do
  describe "program output" do
    it "prints correct truth values for 0" do
      stdout, stderr, status = run_script("./predicates.rb", stdin: "0\n")
      expect(status.exitstatus).to eq(0), "Trouble reading your vibes: #{stderr}"

      lines = normalize_output(stdout)
      expect(lines).to eq(%w[true false true])
    end

    it "prints correct truth values for 5" do
      stdout, _stderr, _status = run_script("./predicates.rb", stdin: "5\n")
      lines = normalize_output(stdout)
      expect(lines).to eq(%w[false true false])
    end
  end

  describe "source code" do
    let(:src) { source_without_comments File.read("predicates.rb") }

    it "calls even? on the number" do
      expect(src).to match(/even\?/), "Use n.even?."
    end

    it "calls odd? on the number" do
      expect(src).to match(/.odd\?/), "Use n.odd?."
    end

    it "calls zero? on the number" do
      expect(src).to match(/zero\?/), "Use n.zero?."
    end
  end
end
