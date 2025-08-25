require 'open3'

RSpec.describe "convert.rb" do
  it "converts string to integer and string to float (ID check passed!)" do
    stdout, stderr, status = Open3.capture3("ruby convert.rb", stdin_data: "42\n3.14\n")
    expect(status.exitstatus).to eq(0), "Script error: #{stderr}"
    lines = stdout.lines.map(&:strip).reject(&:empty?)
    expect(lines[0]).to eq("42"),   "We expected the first line to be 42 via to_i."
    expect(lines[1]).to eq("3.14"), "We expected the second line to be 3.14 via to_f."
  end

  it "calls to_i and to_f" do
    src = File.read("convert.rb")
    expect(src).to match(/\bto_i\b/), "Use String#to_i to turn '42' into 42."
    expect(src).to match(/\bto_f\b/), "Use String#to_f to turn '3.14' into 3.14."
  end
end
