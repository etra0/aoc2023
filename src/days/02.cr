module Day2
  class Solution
    def solve
      input_02 = File.read("./input/02_01.txt")
      puts part_one(input_02)
      puts part_two(input_02)
    end

    def part_one(inp) : Int
      sum = 0
      inp.lines.each do |line|
        game, sets = line.split(":", limit: 2)
        game_id = /Game (\d+)/.match!(game)[1].to_i

        sets = sets
          .split(";")
          .map { |g| g.split(",").map(&.strip.split(" ")) }

        sum += game_id if sets.map { |g| is_game_valid(g) }.all?
      end
      sum
    end

    def part_two(inp) : Int
      sum = 0
      inp.lines.each do |line|
        _, sets = line.split(":", limit: 2)

        sets = sets
          .split(";")
          .map { |g| g.split(",").map(&.strip.split(" ")) }

        current_max = { "red" => 0, "green" => 0, "blue" => 0 }

        sets.each do |g|
          g.each { |c| current_max[c[1]] = Math.max(current_max[c[1]], c[0].to_i) }
        end
        sum += current_max.values.reduce { |acc, v| acc*v }
      end
      sum
    end

    def is_game_valid(game) : Bool
      restriction = {
        "red" => 12,
        "green" => 13,
        "blue" => 14
      }

      game.map { |g| restriction[g[1]] >= g[0].to_i }.all?
    end
  end
end
