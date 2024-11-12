

# General application configuration
import Config

config :backend,
  ecto_repos: [Backend.Repo],
  generators: [timestamp_type: :utc_datetime]

# Configures the endpoint
config :backend, BackendWeb.Endpoint,
  url: [host: "localhost"],
  adapter: Bandit.PhoenixAdapter,
  render_errors: [
    formats: [json: BackendWeb.ErrorJSON],
    layout: false
  ],
  pubsub_server: Backend.PubSub,
  live_view: [signing_salt: "RxuHvqcp"]

# Configures the mailer
#
# By default it uses the "Local" adapter which stores the emails
# locally. You can see the emails in your browser, at "/dev/mailbox".
#
# For production it's recommended to configure a different adapter
# at the `config/runtime.exs`.
config :backend, Backend.Mailer, adapter: Swoosh.Adapters.Local

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Database configuration (update this part)
config :backend, Backend.Repo,
  username: "postgres",  # Replace with your database username if different
  password: "abc123",  # Replace with your actual password
  database: "SUPERUSER",  # Replace with your actual database name
  hostname: "localhost",
  pool_size: 10

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
