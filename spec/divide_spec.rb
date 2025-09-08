require 'spec_helper'

RSpec.describe "divide.rb" do
  it "prints integer division then float division" do
    stdout, stderr, status = run_script("divide.rb", stdin: "5\n2\n")
    expect(status.exitstatus).to eq(0), "Non-zero exit: #{stderr}"

    lines = normalize_output(stdout)

    expect(lines[0]).to eq("2"),   "Integer division 5/2 should be 2."
    expect(lines[1]).to eq("2.5"), "Float division 5/2.0 should be 2.5."
  end

  it "uses to_f (or b.to_f) for float division" do
    clean_src = source_without_comments(File.read("divide.rb"))

    expect(clean_src).to match(%r{/\s*\w+\.to_f\b}), "Use .to_f on the denominator for float division."
  end
end
