defmodule AnthropoTest do
  use ExUnit.Case
  doctest Anthropo

  def test_morph(pairs) do
    pairs
    |> Enum.each(fn {input, expected} ->
      assert Anthropo.morph(input) == expected
    end)
  end

  test "morph" do
    [ # input                   expected
      {"binary",                "binary"    },
      {1_452_000,               "1.45M"     },
      {-1_452_000,              "-1.45M"    },
      {8_345,                   "8.35k"     },
      {23,                      "23"        },
      {585_009,                 "585.01k"   },
      {98_345_987_095,          "98.35B"    },
      {56_345_198_345_987_095,  "56345.2T"  },
    ]
    |> test_morph
  end
end
