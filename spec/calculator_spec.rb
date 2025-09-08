require 'spec_helper'

RSpec.describe "calculator.rb" do
  it "prints results in order (+, -, *, /, %, **)" do
    stdout, stderr, status = run_script("./calculator.rb", stdin: "7\n3\n")
    expect(status.exitstatus).to eq(0), "Calculator failed: #{stderr}"

    lines = normalize_output(stdout)
    expect(lines).to eq(%w[10 4 21 2 1 343])
  end

  it "uses the actual operators (+, -, *, /, %, and **)" do
    clean_src = source_without_comments(File.read("calculator.rb"))
    expect(clean_src).to match(/\+/),   "Use + for addition."
    expect(clean_src).to match(/-/),    "Use - for subtraction."
    expect(clean_src).to match(/\*/),   "Use * for multiplication."
    expect(clean_src).to match(%r{/}),  "Use / for integer division."
    expect(clean_src).to match(/%/),    "Use % for remainder."
    expect(clean_src).to match(/\*\*/), "Use ** for exponentiation."
  end
end
