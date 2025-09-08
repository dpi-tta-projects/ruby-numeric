require 'spec_helper'

RSpec.describe "float_quirk.rb" do
  it "prints 0.1 + 0.2 (floaty business)" do
    stdout, stderr, status = run_script("float_quirk.rb")
    expect(status.exitstatus).to eq(0), "Runtime error: #{stderr}"

    out = stdout.strip
    f = Float(out) rescue nil
    expect(f).not_to be_nil, "Please print a number (use pp)."
    expect(f).to be_within(1e-12).of(0.3), "It should be very close to 0.3 (but not always exactly)."
  end

  it "adds the numeric literals 0.1 and 0.2" do
    clean_src = source_without_comments(File.read("float_quirk.rb"))

    expect(clean_src).to match(/\b0\.1\b/), "Use the literal 0.1."
    expect(clean_src).to match(/\b0\.2\b/), "Use the literal 0.2."
    expect(clean_src).to match(/\+\s*/),    "Use + to add them."
  end
end
