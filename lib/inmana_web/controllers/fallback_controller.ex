defmodule InmanaWeb.FallbackController do
  use InmanaWeb, :controller

  def call(conn, {:error, %{result: result, status: status}}) do
    conn
    |> put_status(status)
    |> put_view(InmanaWeb.ErrorJSON)
    |> render("error.json", result: result)
  end
end
