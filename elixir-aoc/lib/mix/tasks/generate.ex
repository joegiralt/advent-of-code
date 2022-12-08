# lib/mix/tasks/echo.ex
defmodule Mix.Tasks.Generate do
  @moduledoc "Generates AOC boiler plate"
  @shortdoc "Boiler plate generator"
  @root_directory File.cwd!()
  @valid_commands [:solution, :tests, :parser]
  @default_year AdventOfCode.default_year()

  use Mix.Task

  @impl Mix.Task

  def run(["all", year, day]),
    do: Enum.each(@valid_commands, fn cmd -> run([cmd |> to_string, year, day]) end)

  def run([cmd, year, day] = _args) do
    lexed_cdm = lex_command(cmd)
    lex_day = lex_day(day)
    lex_year = lex_year(year)
    formated_day = lex_day |> format_day

    Mix.shell().info(
      "Generating #{lexed_cdm} boilerplate for day #{formated_day} of #{lex_year}."
    )

    generate(lexed_cdm, lex_year, formated_day)
  end

  def lex_command(cmd) do
    lexed_cmd = cmd |> String.to_atom()

    if lexed_cmd not in @valid_commands,
      do:
        raise(
          "Wrong or malformed command.
          valid commands are: [:#{@valid_commands |> Enum.join(", :")}], your input: :#{lexed_cmd} "
        )

    lexed_cmd
  end

  def lex_day(day) do
    {lex_day, ""} = Integer.parse(day)

    if lex_day not in 1..25, do: raise("Day must be between 1 and 25, your input: #{lex_day}")

    lex_day
  end

  def lex_year(year) do
    {lex_year, ""} = Integer.parse(year)

    if lex_year not in 2015..@default_year,
      do:
        raise("Years must be in the range of 2015, to #{@default_year}, your input: #{lex_year}")

    lex_year
  end

  def format_day(day) when day in 1..25 do
    case day do
      day when day in 1..9 -> "0#{day}"
      _ -> "#{day}"
    end
  end

  def generate(cmd, year, day) do
    if file_exists?(cmd, year, day) do
      Mix.shell().info(
        "... #{cmd |> to_string |> String.capitalize()} for year: #{year}, day: #{day} already exist. \n\n"
      )
    else
      persist_file!(cmd, year, day)
    end
  end

  def persist_file!(cmd, year, day) do
    path = file_destination(cmd, year, day)
    :ok = path |> Path.dirname() |> File.mkdir_p()

    :ok =
      File.write(
        path,
        case cmd do
          :solution -> solution_template(year, day)
          :parser -> parser_template(year, day)
          :tests -> tests_template(year, day)
        end
      )
  end

  def file_exists?(cmd, year, day) do
    file_destination(cmd, year, day)
    |> File.exists?()
  end

  def file_destination(cmd, year, day) do
    case cmd do
      :solution ->
        "#{@root_directory}/lib/advent_of_code/year#{year}/day#{day}.ex"

      :parser ->
        "#{@root_directory}/lib/advent_of_code/year#{year}/day#{day}_parser.ex"

      :tests ->
        "#{@root_directory}/test/advent_of_code/year#{year}/day#{day}_test.exs"
    end
  end

  def solution_template(year, day) do
    """
    defmodule AdventOfCode.Year#{year}.Day#{day} do
      @moduledoc "A Day #{day} Solution "
      alias AdventOfCode.Year#{year}.Day#{day}Parser

      def part_1 do
        Day#{day}Parser.run()
      end

      def part_2 do
        Day#{day}Parser.run()
      end
    end
    """
  end

  def tests_template(year, day) do
    """
    defmodule AdventOfCode.Year#{year}.Day#{day}Test do
      use ExUnit.Case

      import AdventOfCode.Year#{year}.Day#{day}

      @tag :skip
      test "part1" do
        result = part_1()

        assert result
      end

      @tag :skip
      test "part2" do
        result = part_2()

        assert result
      end
    end
    """
  end

  def parser_template(year, day) do
    {day_int, ""} = Integer.parse(day)

    """
    defmodule AdventOfCode.Year#{year}.Day#{day}Parser do
      @moduledoc " A normal Parser for day #{day} Solution. "
      def run do
        AdventOfCode.Input.get!(#{day_int}, #{year})
      end
    end
    """
  end

  # defp default_year do
  #   case :calendar.local_time() do
  #     {{y, 12, _}, _} -> y
  #     {{y, _, _}, _} -> y - 1
  #   end
  # end
end
