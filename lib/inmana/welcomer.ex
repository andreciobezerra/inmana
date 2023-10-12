defmodule Inmana.Welcomer do
  @moduledoc """
  sassa
  """
  @spec welcome(map()) :: any()
  def welcome(%{"name" => name, "age" => age}) do
    name
    |> String.trim()
    |> String.downcase()
    |> evaluate(age |> String.to_integer())
  end

  defp evaluate("banana", 42), do: {:ok, "You are special banana"}
  defp evaluate(name, age) when age >= 18, do: {:ok, "Wecolme #{name}!"}
  defp evaluate(name, _age), do: {:error, "You shall not pass #{name}!"}
end
