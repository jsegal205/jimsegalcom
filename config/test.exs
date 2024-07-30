import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :jimsegalcom, Jimsegalcom.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "jimsegalcom_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :jimsegalcom, JimsegalcomWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "tu8Qp3oDiGVfMkn61Orm/JsApF6m5WfMmp9LcdsWeb/dhlWB+I6oqp2ZhuMYY/zL",
  server: false

config :jimsegalcom,
  weather_req_options: [
    plug: {Req.Test, Jimsegalcom.Api.Weather}
  ]

# In test we don't send emails.
config :jimsegalcom, Jimsegalcom.Mailer, adapter: Swoosh.Adapters.Test

# Disable swoosh api client as it is only required for production adapters.
config :swoosh, :api_client, false

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
