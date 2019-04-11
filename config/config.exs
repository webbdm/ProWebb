# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :proWebb,
  ecto_repos: [ProWebb.Repo]

# Configures the endpoint
config :proWebb, ProWebbWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "T/PwMHGCANLWS5azD9Bn2dzeMb+sQAW9bdtC/JDUvi+5rMnjbZS6or46EsMbuYuZ",
  render_errors: [view: ProWebbWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: ProWebb.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
