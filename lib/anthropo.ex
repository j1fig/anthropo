defmodule Anthropo do
  @moduledoc """
  Documentation for `Anthropo`.
  """

  @places 2
  @supported_orders %{
    0 =>  "",
    3 =>  "k",
    6 =>  "M",
    9 =>  "B",
    12 => "T",
  }

  @doc """
  morph.

  Right now we only support parsing integers as quantities.

  ## Examples

      iex> Anthropo.morph(1_000_000)
      "1M"

  """
  def morph(input) when is_integer(input) and input < 0,  do: "-" <> morph(-input)
  def morph(input) when is_integer(input) do
    magnitude = input
    |> Integer.digits
    |> length

    order = @supported_orders
    |> Map.keys
    |> Enum.sort(:desc)
    |> Enum.drop_while(fn order -> order >= magnitude end)
    |> hd

    morphed = input / (10**order)
    |> Float.round(@places)
    |> to_string
    |> String.trim_trailing(".0")

    morphed <> @supported_orders[order]
  end

  # make this match all other conditions, in which we do nothing.
  def morph(input), do: input
end
