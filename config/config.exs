# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :apelbackend,
  ecto_repos: [Apelbackend.Repo]

# Configures the endpoint
config :apelbackend, ApelbackendWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "+tcN3ypGoGeq0jD6CH9bCZqloMYPq1aewBgeT8pObIx0eZ8oJn0w2bks2UirDf1d",
  render_errors: [view: ApelbackendWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Apelbackend.PubSub,
  live_view: [signing_salt: "cFjEjMza"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
