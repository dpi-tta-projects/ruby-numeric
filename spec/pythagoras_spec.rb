# spec/pythagoras_spec.rb
require 'open3'

RSpec.describe "pythagoras.rb" do
  it "computes hypotenuse and rounds to 2 decimals (2, 2 -> 2.83)" do
    stdout, stderr, status = Open3.capture3("ruby pythagoras.rb", stdin_data: "2\n2\n")
    expect(status.exitstatus).to eq(0), "Program error: #{stderr}"
    expect(stdout.strip).to eq("2.83")
  end

  it "computes the 3-4-5 triangle (3, 4 -> 5.0)" do
    stdout, stderr, status = Open3.capture3("ruby pythagoras.rb", stdin_data: "3\n4\n")
    expect(status.exitstatus).to eq(0), "Program error: #{stderr}"
    expect(stdout.strip).to eq("5.0")
  end

  it "uses ** for squaring, Math.sqrt, and round(2)" do
    src = File.read("pythagoras.rb")
    expect(src.scan(/\*\*/).length).to be >= 1, "Use ** for squaring."
    expect(src).to match(/\bMath\.sqrt\b/), "Use Math.sqrt to compute the square root."
    expect(src).to match(/\.round\(\s*2\s*\)/), "Round the result to 2 decimals with round(2)."
  end
end
