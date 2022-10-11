defmodule Inmana.Restaurants.Create do
  alias Inmana.{Repo, Restaurant}

  def call(params) do
    params
    |> Restaurant.changeset()
    |> Repo.insert()
    |> handle_insert()
  end

  defp handle_insert(result) do
    case result do
      {:ok, %Restaurant{}} -> result
      {:error, result} -> {:error, %{result: result, status: :bad_request}}
    end
  end
end
