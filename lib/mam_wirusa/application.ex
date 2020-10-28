Postgrex.Types.define(
  MamWirusa.PostgresTypes,
  [Geo.PostGIS.Extension] ++ Ecto.Adapters.Postgres.extensions(),
  json: Jason
)

defmodule MamWirusa.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      MamWirusa.Repo,
      # Start the Telemetry supervisor
      MamWirusaWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: MamWirusa.PubSub},
      # Start the Endpoint (http/https)
      MamWirusaWeb.Endpoint,
      # Start a worker by calling: MamWirusa.Worker.start_link(arg)
      # {MamWirusa.Worker, arg}
      MamWirusa.Command
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: MamWirusa.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    MamWirusaWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
