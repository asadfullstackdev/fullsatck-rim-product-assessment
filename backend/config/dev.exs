import Config

# Configure your database
config :backend, Backend.Repo,
  username: "postgres",             # Database username
  password: "postgres",             # Database password
  hostname: "localhost",            # Database host (localhost in development)
  database: "backend_dev",          # Name of your database
  stacktrace: true,                 # Useful for debugging
  show_sensitive_data_on_connection_error: true,  # For debugging
  pool_size: 10                     # Pool size for connections

# Configure your Phoenix endpoint
config :backend, BackendWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4000],  # Bind to localhost on port 4000
  check_origin: false,                    # Disable origin check
  code_reloader: true,                    # Enable code reloading in dev
  debug_errors: true,                     # Enable error debugging in dev
  secret_key_base: "C8JClXswMJu+WGGt4u1Dixs20/cpJvhP+aqB4XoNaaKgnyydJ5sfjb+guCopEn4a",  # Your secret key for sessions and cookies
  watchers: []                            # Add your asset watchers here (e.g., for live reload)

# Enable dev routes for dashboard and mailbox
config :backend, dev_routes: true

# Do not include metadata nor timestamps in development logs
config :logger, :console, format: "[$level] $message\n"

# Set a higher stacktrace during development for easier debugging
config :phoenix, :stacktrace_depth, 20

# Initialize plugs at runtime for faster development compilation
config :phoenix, :plug_init_mode, :runtime

# Disable swoosh api client as it is only required for production adapters
config :swoosh, :api_client, false
