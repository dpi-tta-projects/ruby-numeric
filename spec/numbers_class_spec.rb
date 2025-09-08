
RSpec.describe "numbers_class.rb" do
  it "prints the class of an integer and a float" do
    stdout, stderr, status = run_script("./numbers_class.rb")
    expect(status.exitstatus).to eq(0), "Non-zero exit: #{stderr}"

    lines = normalize_output(stdout)
    expect(lines).to include("Integer")
    expect(lines).to include("Float")
  end

  it "calls .class on an integer literal" do
    clean_src = source_without_comments(File.read("numbers_class.rb"))
    expect(clean_src).to match(/\b\d+\.class\b/), "Use .class on an Integer."
  end

  it "calls .class on a float literal" do
    clean_src = source_without_comments(File.read("numbers_class.rb"))
    expect(clean_src).to match(/\b\d+\.\d+\.class\b/), "Use .class on a Float."
  end
end
