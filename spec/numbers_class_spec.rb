require 'open3'

RSpec.describe "numbers_class.rb" do
  it "prints Integer and Float classes" do
    stdout, stderr, status = Open3.capture3("ruby numbers_class.rb")
    expect(status.exitstatus).to eq(0), "Non-zero exit: #{stderr}"
    lines = stdout.lines.map(&:strip).reject(&:empty?)
    expect(lines).to include("Integer")
    expect(lines).to include("Float")

    src = File.read("numbers_class.rb")
    # Remove prompt comments (lines starting with optional whitespace and `#`)
    src = src.lines.reject { |line| line.strip.start_with?("#") }.join

    # Match any integer literal followed by .class
    expect(src).to match(/\b\d+\.class\b/), "Use .class on an Integer."

    # Match any float literal followed by .class (digits . digits)
    expect(src).to match(/\b\d+\.\d+\.class\b/), "Use .class on a Float."
  end
end
