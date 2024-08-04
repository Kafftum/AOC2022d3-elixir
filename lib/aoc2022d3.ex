defmodule Aoc2022d3 do
  use Application

  def start(_type, _args) do
    Aoc2022d3.main()
    Supervisor.start_link([], strategy: :one_for_one)
  end

  def main do
    input = File.stream!("lib/daythree.txt")
            |> Enum.map(fn line -> line |> String.split |> solve end)
            |> Enum.sum

    IO.inspect(input)
  end

  def solve(line) do
    line
    |> getCompartments
    |> compartmentMatch
    |> letterEval
  end

  def getCompartments(line) do
    line = line |> Enum.at(0)
    l = String.length line
    mp = trunc(l/2)

    first = line |> String.slice(0..mp-1)
    second = line |> String.slice(mp..l)

    {first, second}
  end

  def compartmentMatch(compartments) do
    second = elem(compartments, 1) |> String.graphemes

    elem(compartments, 0)
    |> String.graphemes
    |> Enum.filter(fn char -> Enum.member?(second, char) end)
    |> List.first
  end

  def letterEval(letter) do
    case letter do
       "a" -> 1
       "b" -> 2
       "c" -> 3
       "d" -> 4
       "e" -> 5
       "f" -> 6
       "g" -> 7
       "h" -> 8
       "i" -> 9
       "j" -> 10
       "k" -> 11
       "l" -> 12
       "m" -> 13
       "n" -> 14
       "o" -> 15
       "p" -> 16
       "q" -> 17
       "r" -> 18
       "s" -> 19
       "t" -> 20
       "u" -> 21
       "v" -> 22
       "w" -> 23
       "x" -> 24
       "y" -> 25
       "z" -> 26
       "A" -> 27
       "B" -> 28
       "C" -> 29
       "D" -> 30
       "E" -> 31
       "F" -> 32
       "G" -> 33
       "H" -> 34
       "I" -> 35
       "J" -> 36
       "K" -> 37
       "L" -> 38
       "M" -> 39
       "N" -> 40
       "O" -> 41
       "P" -> 42
       "Q" -> 43
       "R" -> 44
       "S" -> 45
       "T" -> 46
       "U" -> 47
       "V" -> 48
       "W" -> 49
       "X" -> 50
       "Y" -> 51
       "Z" -> 52
        _ -> 0
     end
  end
end
