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

describe Day2 do
  # TODO: Write tests

  it "solves day 2 part 1" do
    content = File.read("./input/02_00.txt")
    sol = Day2::Solution.new.part_one content
    sol.should eq(8)
  end

  it "solves day 1 part 2" do
    content = File.read("./input/02_00.txt")
    sol = Day2::Solution.new.part_two content
    sol.should eq(2286)

  end
end
