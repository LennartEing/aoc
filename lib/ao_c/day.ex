defmodule AoC.Day do
  defmacro __using__(_opts) do
    quote do
      import AoC.Utils.Input, only: [get!: 2]

      @behaviour AoC.Day

      def part1(), do: input!() |> part1()
      def part1(input, :test), do: input |> parse_input!() |> part1()

      def part2(), do: input!() |> part2()
      def part2(input, :test), do: input |> parse_input!() |> part2()

      defp input! do
        [day: day, year: year] =
          Regex.named_captures(
            ~r/AoC.Y(?<year>\d+).D(?<day>\d+)/,
            __MODULE__ |> to_string()
          )
          |> Enum.map(fn {key, val} -> {String.to_atom(key), String.to_integer(val)} end)

        get!(year, day)
        |> parse_input!()
      end
    end
  end

  @callback parse_input!(binary()) :: term()
  @callback part1(term()) :: term()
  @callback part2(term()) :: term()
end
