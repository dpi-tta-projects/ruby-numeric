require 'open3'

RSpec.describe "methods.rb" do
  it "prints abs, next, gcd(10), and a random number (number superpowers!)" do
    stdout, stderr, status = Open3.capture3("ruby methods.rb", stdin_data: "-7\n")
    expect(status.exitstatus).to eq(0), "Yikes—runtime error: #{stderr}"
    lines = stdout.lines.map(&:strip).reject(&:empty?)
    expect(lines[0]).to eq("7"),    "abs turns -7 into 7."
    expect(lines[1]).to eq("-6"),   "next after -7 is -6."
    expect(lines[2]).to eq("1"),    "10.gcd(-7) is 1."

    r = Integer(lines[3]) rescue nil
    expect(r).not_to be_nil, "rand(10) should print a whole number."
    expect(r).to be_between(0,9), "rand(10) is always 0..9—no cheating!"
  end

  it "uses abs, next, gcd, and rand(10)" do
    src = File.read("methods.rb")
    expect(src).to match(/\babs\b/),        "Call n.abs."
    expect(src).to match(/\bnext\b/),       "Call n.next."
    expect(src).to match(/\bgcd\s*\(/),     "Call 10.gcd(n)."
    expect(src).to match(/\brand\s*\(\s*10\s*\)/), "Call rand(10)."
  end
end
