# spec/lucky_number_spec.rb
require 'open3'

RSpec.describe "lucky_number.rb" do
  it "generates a number between 1 and 100" do
    stdout, stderr, status = Open3.capture3("ruby lucky_number.rb")
    expect(status.exitstatus).to eq(0), "Program error: #{stderr}"
    lines = stdout.lines.map(&:strip)
    n = Integer(lines.first)
    expect(n).to be_between(1, 100)
  end

  it "prints lucky when divisible by 7" do
    allow(Kernel).to receive(:rand).and_return(14)
    stdout, _, _ = Open3.capture3("ruby lucky_number.rb")
    lines = stdout.lines.map(&:strip)
    expect(lines).to eq(%w[14 lucky])
  end

  it "prints lucky when number contains digit 7" do
    allow(Kernel).to receive(:rand).and_return(17)
    stdout, _, _ = Open3.capture3("ruby lucky_number.rb")
    lines = stdout.lines.map(&:strip)
    expect(lines).to eq(%w[17 lucky])
  end

  it "prints unlucky otherwise" do
    allow(Kernel).to receive(:rand).and_return(13)
    stdout, _, _ = Open3.capture3("ruby lucky_number.rb")
    lines = stdout.lines.map(&:strip)
    expect(lines).to eq(%w[13 unlucky])
  end

  it "uses rand, %, and to_s.include?" do
    src = File.read("lucky_number.rb")
    expect(src).to match(/rand/), "Use rand(1..100) to generate the number."
    expect(src).to match(/%/), "Use % for divisibility check."
    expect(src).to match(/to_s\.include\?\(["']7["']\)/),
      "Check for digit 7 with to_s.include?(\"7\")."
  end
end
