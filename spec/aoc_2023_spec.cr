require "./spec_helper"

describe Day1 do
  # TODO: Write tests

  it "solves day 1 part 1" do
    content = File.read("./input/01_00.txt")
    sol = Day1::Solution.new.first_case content
    sol.should eq(142)

  end

  it "solves day 1 part 2" do
    content = File.read("./input/01_02.txt")
    sol = Day1::Solution.new.second_case content
    sol.should eq(281)

  end
end
