# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :mam_wirusa,
  ecto_repos: [MamWirusa.Repo]

config :mam_wirusa, event_stores: [MamWirusa.EventStore]

# Configures the endpoint
config :mam_wirusa, MamWirusaWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "o/NgJOp1b4m0cvOlv9FBsexoYjUJq9BNnDB5SKX2qGLt9DytNX6ipKeemN3bpx5e",
  render_errors: [view: MamWirusaWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: MamWirusa.PubSub,
  live_view: [signing_salt: "tbM1tEJW"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
