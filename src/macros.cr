macro require_days(root_path)
  {% for i in (1..parse_type("Macros::SOLVED_DAYS").resolve) %}
    {% if i < 10 %}
    require "#{ {{root_path}} }days/0{{i}}"
    {% else %}
    require "#{ {{root_path}} }days/{{i}}"
    {% end %}
  {% end %}
end

macro define_cases(day)
  case {{day}}
  {% for i in (1..parse_type("Macros::SOLVED_DAYS").resolve) %}
    when {{i.id}}
      sol = Day{{i.id}}::Solution.new
      sol.solve
  {% end %}
    else
      raise "Unknown case"
  end
end

module Macros
  SOLVED_DAYS = 2
end
