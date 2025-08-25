require 'open3'

RSpec.describe "predicates.rb" do
  it "prints even?, odd?, zero? truths (tell us the vibes)" do
    stdout, stderr, status = Open3.capture3("ruby predicates.rb", stdin_data: "0\n")
    expect(status.exitstatus).to eq(0), "Trouble reading your vibes: #{stderr}"
    expect(stdout.lines.map(&:strip).reject(&:empty?)).to eq(%w[true false true])

    stdout2, _, _ = Open3.capture3("ruby predicates.rb", stdin_data: "5\n")
    expect(stdout2.lines.map(&:strip).reject(&:empty?)).to eq(%w[false true false])
  end

  it "calls even?, odd?, and zero?" do
    src = File.read("predicates.rb")
    expect(src).to match(/\beven\?\b/), "Use n.even?."
    expect(src).to match(/\bodd\?\b/),  "Use n.odd?."
    expect(src).to match(/\bzero\?\b/), "Use n.zero?."
  end
end
