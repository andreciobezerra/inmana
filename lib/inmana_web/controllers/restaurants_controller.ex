defmodule InmanaWeb.RestaurantsController do
  alias InmanaWeb.FallbackController
  alias Inmana.Restaurant
  use InmanaWeb, :controller

  action_fallback(FallbackController)

  def create(conn, params) do
    with {:ok, %Restaurant{} = restaurant} <- Inmana.create_restaurant(params) do
      conn
      |> put_status(:created)
      |> json(%{restaurant: restaurant})
    end
  end
end
