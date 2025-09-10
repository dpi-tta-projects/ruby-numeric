
RSpec.describe "lucky_number.rb" do

  describe "output" do
    it "generates a number between 1 and 100" do
      output = run_lucky_number
      lucky_number = Integer(output.first)
      expect(lucky_number).to be_between(1, 100)
    end

    it "prints lucky when divisible by 7" do
      expect(run_lucky_number(rand_value: 14)).to eq(["14", "lucky"])
    end

    it "prints lucky when number contains digit 7" do
      expect(run_lucky_number(rand_value: 17)).to eq(["17", "lucky"])
    end

    it "prints unlucky otherwise" do
      expect(run_lucky_number(rand_value: 13)).to eq(["13", "unlucky"])
    end
  end
end

def run_lucky_number(rand_value: nil)
  allow_any_instance_of(Object).to receive(:rand).and_return(rand_value) if rand_value

  run_script_and_capture_lines("lucky_number.rb")
end
