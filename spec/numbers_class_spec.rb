
RSpec.describe "numbers_class.rb" do

  describe "output" do
    it "prints the class of an integer and a float" do
      output = run_script_and_capture_lines("numbers_class.rb")

      expect(output).to include("Integer")
      expect(output).to include("Float")
    end
  end

  describe "code" do
    let(:source_code) { strip_comments(File.read("numbers_class.rb")) }

    it "calls .class on an integer literal" do
      expect(source_code).to match(/\b\d+\.class\b/), "Use .class on an Integer."
    end

    it "calls .class on a float literal" do
      expect(source_code).to match(/\b\d+\.\d+\.class\b/), "Use .class on a Float."
    end
  end
end
