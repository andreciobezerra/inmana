defmodule Inmana.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      InmanaWeb.Telemetry,
      # Start the Ecto repository
      Inmana.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Inmana.PubSub},
      # Start Finch
      {Finch, name: Inmana.Finch},
      # Start the Endpoint (http/https)
      InmanaWeb.Endpoint
      # Start a worker by calling: Inmana.Worker.start_link(arg)
      # {Inmana.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Inmana.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    InmanaWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
