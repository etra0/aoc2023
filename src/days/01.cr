module Day1
  class Solution
    def solve
      input_01 = File.read("./input/01_01.txt")
      puts first_case(input_01)
      puts second_case(input_01)
    end

    def first_case(str)
      sum = 0
      str.lines.each do |line|
        first = line.each_char.find! { |c| c.number? }
        second = line.reverse.each_char.find! { |c| c.number? }
        sum += String::Builder.new.tap { |s| s << first << second }.to_s.to_i
      end

      sum
    end

    def word_to_n(str : String)
      mapping = {
        "one" => "1",
        "two" => "2",
        "three" => "3",
        "four" => "4",
        "five" => "5",
        "six" => "6",
        "seven" => "7",
        "eight" => "8",
        "nine" => "9",
      }

      return str if str.size == 1

      return mapping[str]
    end

    def second_case(str)
      sum = 0
      regex = /(one|two|three|four|five|six|seven|eight|nine|\d)/
      # Ugly hack but it werks.
      last_regex = /\w*(one|two|three|four|five|six|seven|eight|nine|\d)/

      str.lines.each do |line|
        first_match = regex.match!(line)
        first_value = word_to_n first_match[1]

        second_match = last_regex.match(line)
        second_value = (second_match.try { |v| word_to_n(v[1]) }) || first_value

        sum += (first_value + second_value).to_i
      end

      sum
    end
  end
end
