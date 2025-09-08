require 'open3'

RSpec.describe "calculator.rb" do
  it "prints +, -, *, /, %, ** in order (your pocket calculator)" do
    stdout, stderr, status = Open3.capture3("ruby calculator.rb", stdin_data: "7\n3\n")
    expect(status.exitstatus).to eq(0), "Calculator fell off the desk: #{stderr}"
    lines = stdout.lines.map(&:strip).reject(&:empty?)
    expect(lines).to eq(%w[10 4 21 2 1 343]),
      "Expected results (one per line): 10, 4, 21, 2, 1, 343."
  end

  it "uses the actual operators" do
    src = File.read("calculator.rb")

    # Remove prompt comments (lines starting with optional whitespace and `#`)
    src = src.lines.reject { |line| line.strip.start_with?("#") }.join

    expect(src).to match(/\+/),      "Use + for addition."
    expect(src).to match(/-/),       "Use - for subtraction."
    expect(src).to match(/\*/),      "Use * for multiplication."
    expect(src).to match(%r{\/}),    "Use / for integer division."
    expect(src).to match(/%/),       "Use % for remainder."
    expect(src).to match(/\*\*/),    "Use ** for exponentiation."
  end
end
