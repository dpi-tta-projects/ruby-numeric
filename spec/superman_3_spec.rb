# spec/superman_3_spec.rb
require 'open3'

RSpec.describe "superman_3.rb" do
  it "prints raw float then rounded value" do
    stdout, stderr, status = Open3.capture3("ruby superman_3.rb", stdin_data: "1234.56\n")
    expect(status.exitstatus).to eq(0), "Program error: #{stderr}"
    lines = stdout.lines.map(&:strip).reject(&:empty?)
    expect(lines.length).to eq(2)
    raw, rounded = lines
    expect(raw.to_f).to be_within(0.001).of(123.456)
    expect(rounded).to eq("123.46")
  end

  it "uses * and round(2)" do
    src = File.read("superman_3.rb")
    expect(src).to match(/\*/), "Use * to compute 10%."
    expect(src).to match(/\.round\(\s*2\s*\)/), "Use .round(2) to round to 2 decimals."
  end
end
