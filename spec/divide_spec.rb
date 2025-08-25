require 'open3'

RSpec.describe "divide.rb" do
  it "prints integer division then float division" do
    stdout, stderr, status = Open3.capture3("ruby divide.rb", stdin_data: "5\n2\n")
    expect(status.exitstatus).to eq(0), "Non-zero exit: #{stderr}"
    lines = stdout.lines.map(&:strip).reject(&:empty?)
    expect(lines[0]).to eq("2"),   "Integer division 5/2 should be 2."
    expect(lines[1]).to eq("2.5"), "Float division 5/2.0 should be 2.5."
  end

  it "uses to_f (or b.to_f) for float division" do
    src = File.read("divide.rb")
    # Remove prompt comments (lines starting with optional whitespace and `#`)
    src = src.lines.reject { |line| line.strip.start_with?("#") }.join

    expect(src).to match(%r{/\s*\w+\.to_f\b}), "Use .to_f on the denominator for float division."
  end
end
